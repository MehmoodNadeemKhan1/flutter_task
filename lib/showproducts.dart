import 'package:flutter/material.dart';
import 'package:flutter_task/updatelist.dart';
import 'data/repositories/database_based_implementation.dart';
import 'data/services/product_service.dart';
import 'data/utils/Pinata_service.dart';
import 'data/utils/product_listing_app_database.dart';
import 'data/models/product_listing_model.dart';

class Showproducts extends StatefulWidget {

  const Showproducts({super.key});

  @override
  State<Showproducts> createState() => _ShowproductsState();
}

class _ShowproductsState extends State<Showproducts> {

  late final ProductService _productService;
  List<Product> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    final db = AppDatabase();
    final repo = ProductDatabaseRepository(db);
    final ipfs = PinataService();
    _productService = ProductService(repo, ipfs);

    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    _products = (await _productService.allProducts())!;
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _deleteProducts(String id) async {
    await _productService.deleteProduct(id);
    await _fetchProducts();
  }
  Future<void> _updateProducts(String id) async {
    final existingData = await _productService.singleProduct(id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Updatelist(product:existingData,ID:id ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Product List"),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.images.isNotEmpty)
                    SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: product.images.length,
                        separatorBuilder: (_, __) => SizedBox(width: 8),
                        itemBuilder: (context, imgIndex) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.images[imgIndex],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey[300],
                                child: Icon(Icons.broken_image),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  SizedBox(height: 8),
                  Text(product.name,
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text("\$${product.price}",
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey[700])),
                  ElevatedButton(
                    onPressed: product.id != null
                        ? () async {
                      await _deleteProducts(product.id!);
                    }
                        : null,
                    child: Text("Delete"),
                  ),
                  ElevatedButton(
                    onPressed: product.id != null
                        ? () async {
                      await _updateProducts(product.id!);
                    }
                        : null,
                    child: Text("Update"),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
