import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/models/product_listing_model.dart';
import 'package:flutter_task/data/utils/Pinata_service.dart';
import 'package:image_picker/image_picker.dart';
import 'data/repositories/database_based_implementation.dart';
import 'data/services/product_service.dart';
import 'data/utils/product_listing_app_database.dart';

class Createlist extends StatefulWidget {
  const Createlist({super.key});

  @override
  State<Createlist> createState() => _CreatelistState();
}

class _CreatelistState extends State<Createlist> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _addNoteController = TextEditingController();

  List<File> _images = [];

  final ImagePicker _picker = ImagePicker();

  String? _selectedCategory;
  final List<String> _categories = ["Electronics", "Clothing", "Books"];
  String? _selectedCondition;
  final List<String> _condtion = ["Electronics", "Clothing", "Books"];
  String? _selectedLocation;
  final List<String> _location = ["Electronics", "Clothing", "Books"];
  String? _selectedMaterial;
  final List<String> _material = ["Electronics", "Clothing", "Books"];

  late final ProductService _productService;

  Future<void> _pickImages() async{
    final pickedFiles = await _picker.pickMultiImage();
    if(pickedFiles.isNotEmpty){
      setState(() {
        _images = pickedFiles.map((e)=> File(e.path)).toList();
      });
    }
  }


  @override
  void initState() {
    super.initState();
    final db = AppDatabase();
    final repo = ProductDatabaseRepository(db);
    final ipfs = PinataService();
    _productService = ProductService(repo,ipfs);
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        id: '',
        name: _nameController.text,
        category: _selectedCategory ?? '',
        price: int.parse(_priceController.text),
        images: [],
        isNegotiable: false,
        description: _descriptionController.text,
        condition: _selectedCondition ?? '',
        location: _selectedLocation ?? '',
        material: _selectedMaterial ?? '',
        color: _colorController.text,
        addNote: _addNoteController.text,
        createdAt: DateTime.now().toIso8601String(),
      );

      await _productService.createProduct(product,files: _images);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Product saved successfully!")),
      );
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("dddd"),
    );

  }
}


