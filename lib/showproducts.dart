import 'package:flutter/material.dart';
import 'package:flutter_task/product_detail.dart';
import 'package:flutter_task/updatelist.dart';
import 'data/repositories/database_based_implementation.dart';
import 'data/services/product_service.dart';
import 'data/utils/Pinata_service.dart';
import 'data/utils/product_listing_app_database.dart';
import 'data/models/product_listing_model.dart';
import 'package:cached_network_image/cached_network_image.dart';


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
        builder: (context) => Updatelist(product: existingData, ID: id),
      ),
    );
  }

  Future<void> _findProduct(String id) async {
    final data = await _productService.singleProduct(id);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetail(productD: data),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Product List"),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final product = _products[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                if (product.id != null) {
                  _findProduct(product.id!);
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product.images.isNotEmpty)
                      SizedBox(
                        height: 180,
                        child: PageView.builder(
                          itemCount: product.images.length,
                          itemBuilder: (context, index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: product.images[index],
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  color: Colors.grey[200],
                                  child: const Center(child: CircularProgressIndicator()),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.broken_image,
                                      size: 50, color: Colors.grey),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "\$${product.price ?? '-'}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text(product.category),
                          backgroundColor: Colors.blue.shade50,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 16, color: Colors.grey),
                            Text(
                              product.location,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: product.id != null
                              ? () async {
                            await _updateProducts(product.id!);
                          }
                              : null,
                          icon: const Icon(Icons.edit,
                              size: 18, color: Colors.blue),
                          label: const Text("Update",
                              style: TextStyle(color: Colors.blue)),
                        ),
                        TextButton.icon(
                          onPressed: product.id != null
                              ? () async {
                            await _deleteProducts(product.id!);
                          }
                              : null,
                          icon: const Icon(Icons.delete,
                              size: 18, color: Colors.red),
                          label: const Text("Delete",
                              style: TextStyle(color: Colors.red)),
                        ),
                        TextButton.icon(
                          onPressed: product.id != null
                              ? () async {
                            await _findProduct(product.id!);
                          }
                              : null,
                          icon: const Icon(Icons.info,
                              size: 18, color: Colors.green),
                          label: const Text("Details",
                              style: TextStyle(color: Colors.green)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
