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
    bool _isNegotiable = false;
    List<File> _images = [];
    bool _isFormValid = false;
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
            _images = pickedFiles.take(5).map((file) => File(file.path)).toList();
          });
          _formKey.currentState?.validate();

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
            if (!mounted) return;
            Future.delayed(Duration.zero, () {
              if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Product saved successfully!")),
                );
              }
            });
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
                    onChanged: () {
                      setState(() {
                        _isFormValid = _formKey.currentState?.validate()?? false;
                      });
                    },
                    child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(left: 20,bottom: 15),
                           child: RichText(
                             text: TextSpan(
                               children: [
                                 const TextSpan(
                                   text: "Add Image",
                                   style: TextStyle(color: Colors.black, fontSize: 16),
                                 ),
                                 const TextSpan(
                                   text: " *",
                                   style: TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                                 ),
                               ],
                             ),
                           ),
                         ),
                         FormField<List<File>>(
                           validator: (value) {
                             if (_images.isEmpty) {
                               return "At least one image is required";
                             }
                             return null;
                           },
                           builder: (state) {
                             return Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SizedBox(
                                   height: 70, // container ki height fix karni zaroori hai
                                   child: SingleChildScrollView(
                                     scrollDirection: Axis.horizontal,
                                     child: Row(
                                       children: List.generate(5, (index) {
                                         return Padding(
                                           padding: const EdgeInsets.only(right: 8), // thoda gap dena images ke beech
                                           child: PickImageContainer(
                                             image: index < _images.length ? _images[index] : null,
                                             onAddImage: () async {
                                               await _pickImages();
                                               state.didChange(_images);
                                             },
                                             onRemove: index < _images.length
                                                 ? () {
                                               setState(() {
                                                 _images.removeAt(index);
                                               });
                                               state.didChange(_images);
                                             }
                                                 : null,
                                           ),
                                         );
                                       }),
                                     ),
                                   ),
                                 ),
                                 if (state.hasError)
                                   Padding(
                                     padding: const EdgeInsets.only(left: 20, top: 5),
                                     child: Text(
                                       state.errorText!,
                                       style: const TextStyle(color: Colors.red, fontSize: 12),
                                     ),
                                   ),
                               ],
                             );
                           },
                         ),
                         CustomTextField(controller: _nameController,fieldName: "Item Name",isRequired:true),
                         CustomDropDownField(fieldName: "Choose category", isRequired: true, items: _categories,value: _selectedCategory,onChanged: (val){setState(() {
                           _selectedCategory = val;
                         });},),
                         CustomTextField(controller: _descriptionController,fieldName: "Description",isRequired:true),
                         CustomTextField(controller: _priceController,fieldName: "Price in USD",isRequired:true,keyboardType: TextInputType.number,),
                         Row(
                           children: [
                             Expanded(
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 20),
                                 child: Text(
                                   "Check the box if you are flexible to negotiate the price.",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w400,
                                     fontSize: 12.0,
                                   ),
                                 ),
                               ),
                             ),
                             Checkbox(
                               value: _isNegotiable,
                               onChanged: (val) {
                                 setState(() {
                                   _isNegotiable = val ?? false;
                                 });
                               },

                             ),
                           ],
                         ),
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
                         SizedBox(height: 10,),
                         Center(

                             child: ElevatedButton(
                                 onPressed: _isFormValid ? _submitForm : null,
                                 style: ElevatedButton.styleFrom(
                                     padding: EdgeInsets.only(left: 62, right: 62, top: 13,bottom: 13),
                                     fixedSize: Size(350, 48),
                                     backgroundColor: Color(0xFF32B780),
                                     foregroundColor: Color(0xFFFFFFFF),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.zero
                                     ),
                                     textStyle: TextStyle(
                                         fontSize: 14,
                                         fontWeight: FontWeight.w500,
                                     )
                                 ),
                                 child: Text("Create listing")
                             )
                         ),
                         SizedBox(height: 10,),
                         Center(
                             child: TextButton(onPressed: ()
                             {
                             },
                                 style: TextButton.styleFrom(
                                     fixedSize: Size(350, 60),
                                     foregroundColor: Color(0xFF32B780),
                                     textStyle: TextStyle(
                                       fontSize: 14,
                                       fontWeight: FontWeight.w500,
                                     )
                                 ),
                                 child: Text("Sell as Free Item")
                             )
                         ),
                         SizedBox(height: 20,),
                       ],
                     ),
                    )
                )
            )
        );
    }
}

class PickImageContainer extends StatelessWidget {
  final VoidCallback onAddImage;
  final File? image;
  final VoidCallback? onRemove;
  const PickImageContainer({
    super.key,
    required this.onAddImage,
    required this.image,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19),
          child: GestureDetector(
          onTap: onAddImage,
          child: Stack(
            children: [ Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFFEEEDED),
              ),
              child: image != null
              ? ClipRRect(
                child: Image.file(
                  image!,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              )
                  :Center(
                child: Text(
                  "+",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              )
            ),
              if (onRemove != null)
                Positioned(
                  top: -5,
                  right: -5,
                  child: GestureDetector(
                    onTap: onRemove,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.close,
                          size: 14,
                          color: Colors.red[800],
                        ),
                      ),

                    ),
                  ),
                ),
            ]
          ),

                ),
        ),
    ]
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
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) {
            return "Enter the $fieldName";
          }
          return null;
        }
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