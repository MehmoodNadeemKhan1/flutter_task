import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_task/data/models/product_listing_model.dart';
import 'package:flutter_task/data/utils/Pinata_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'data/repositories/database_based_implementation.dart';
import 'data/services/product_service.dart';
import 'data/utils/product_listing_app_database.dart';

class Createlist extends StatefulWidget
{
    const Createlist({super.key});

    @override
    State<Createlist> createState() => _CreatelistState();
}

class _CreatelistState extends State<Createlist>
{
    final _formKey = GlobalKey<FormState>();

    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _priceController = TextEditingController();
    final TextEditingController _descriptionController = TextEditingController();
    final TextEditingController _colorController = TextEditingController();
    final TextEditingController _addNoteController = TextEditingController();
    final bool _isNegotiable = false;
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


    Future<void> _pickImages() async {
      var status = await Permission.photos.request();
      if (status.isDenied) {
        status = await Permission.storage.request();
      }

      if (status.isGranted) {
        final List<XFile> pickedFiles = await _picker.pickMultiImage();

        if (pickedFiles.isNotEmpty) {
          setState(() {
            _images = pickedFiles.take(3).map((file) => File(file.path)).toList();
          });
        }
      } else if (status.isPermanentlyDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Permission permanently denied. Enable it from settings."),
          ),
        );
        await openAppSettings();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Permission denied.")),
        );
      }
    }




    @override
    void initState() 
    {
        super.initState();
        final db = AppDatabase();
        final repo = ProductDatabaseRepository(db);
        final ipfs = PinataService();
        _productService = ProductService(repo, ipfs);
    }

    Future<void> _submitForm() async
    {
        if (_formKey.currentState!.validate()) 
        {
            final product = Product(
                id: '',
                name: _nameController.text,
                category: _selectedCategory ?? '',
                price: int.parse(_priceController.text),
                images: [],
                isNegotiable: _isNegotiable,
                description: _descriptionController.text,
                condition: _selectedCondition ?? '',
                location: _selectedLocation ?? '',
                material: _selectedMaterial ?? '',
                color: _colorController.text,
                addNote: _addNoteController.text,
                createdAt: DateTime.now().toIso8601String()
            );

            await _productService.createProduct(product, files: _images);

            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Product saved successfully!"))
            );
            _formKey.currentState!.reset();
        }
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(title: Text("Create Listing")),
            body: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                     child: Column(
                       children: [
                         ElevatedButton.icon(
                           onPressed: _pickImages,
                           icon: const Icon(Icons.image),
                           label: const Text("Pick Images"),
                         ),
                         Wrap(
                           spacing: 8,
                           children: _images
                               .map((file) => Image.file(file, height: 80, width: 80, fit: BoxFit.cover))
                               .toList(),
                         ),

                         const SizedBox(height: 20),

                         CustomTextField(controller: _nameController,fieldName: "Item Name",isRequired:true),
                         CustomDropDownField(fieldName: "Choose category", isRequired: true, items: _categories,value: _selectedCategory,onChanged: (val){setState(() {
                           _selectedCategory = val;
                         });},),
                         CustomTextField(controller: _descriptionController,fieldName: "Description",isRequired:true),
                         CustomTextField(controller: _priceController,fieldName: "Price in USD",isRequired:true,keyboardType: TextInputType.number,),
                         CustomDropDownField(fieldName: "Choose condition", isRequired: true, items: _condtion,value: _selectedCondition,onChanged: (val){setState(() {
                           _selectedCondition = val;
                         });},),
                         CustomDropDownField(fieldName: "Location", isRequired: true, items: _location,value: _selectedLocation,onChanged: (val){setState(() {
                           _selectedLocation = val;
                         });},),
                         CustomDropDownField(fieldName: "Choose material", isRequired: true, items: _material,value: _selectedMaterial,onChanged: (val){setState(() {
                           _selectedMaterial = val;
                         });},),
                         CustomTextField(controller: _colorController,fieldName: "Color",isRequired:true),
                         CustomTextField(controller: _addNoteController,fieldName: "Add note(Optional)",isRequired:false),
                         SizedBox(height: 20,),
                         ElevatedButton(onPressed: (){
                           _submitForm();
                         }, child:const Text("Save Product") )
                       ],
                     ),
                    )
                )
            )
        );
    }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.fieldName,
    required this.isRequired,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,

  });

  final TextEditingController controller;
  final String fieldName;
  final bool isRequired;
  final TextInputType keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(hint:Text.rich(
          TextSpan(
            text: fieldName,
            style: TextStyle(fontSize: 24
            ),
              children: isRequired ? const [
                  TextSpan(
                      text: " *",
                      style: TextStyle(color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)
                  )
            ] : []
          ),
        )
        ),
        validator: (value) =>
        value == null || value.isEmpty ? "Enter the $fieldName" : null,
      ),
    );
  }
}

class CustomDropDownField extends StatelessWidget {
  const CustomDropDownField({
    super.key,
    required this.fieldName,
    required this.isRequired,
    required this.items,
    required this.value,
    required this.onChanged,

  });

  final String fieldName;
  final bool isRequired;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: DropdownButtonFormField<String>(
        value: value,
        items: items
            .map((item) => DropdownMenuItem(
          value: item,
          child: Text(item),
        ))
            .toList(),
        onChanged: onChanged,
        decoration: InputDecoration(hint:Text.rich(
          TextSpan(
              text: fieldName,
              style: TextStyle(fontSize: 24
              ),
              children: isRequired ? const [
                TextSpan(
                    text: " *",
                    style: TextStyle(color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)
                )
              ] : []
          ),
        )
        ),
        validator: (value) =>
        value == null  ? "Enter the $fieldName" : null,
      ),
    );
  }
}