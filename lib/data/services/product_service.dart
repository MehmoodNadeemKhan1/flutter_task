import 'dart:io';

import 'package:flutter_task/data/models/product_listing_model.dart';
import 'package:flutter_task/data/repositories/implementation_interface.dart';
import 'package:flutter_task/data/services/service_interface.dart';
import 'package:flutter_task/data/utils/Pinata_service.dart';
import 'package:uuid/uuid.dart';


class ProductService implements IService<Product>{
  final IRepository<Product> repository;
  ProductService(this.repository, this.pinataService);
  final _uuid = Uuid();
  final PinataService pinataService;




  @override
  Future<List<Product>?> allProducts() async {
   return await repository.list();
  }

  @override
  Future<Product> createProduct(Product item, {List<File>? files}) async {
    List<String> urls = [];
    if (files != null && files.isNotEmpty) {
      urls = await pinataService.uploadFiles(files);
    }
    final productWithId = item.copyWith(
      id: _uuid.v4(),
      images: urls,
    );
    return await repository.create(productWithId);
  }

  @override
  Future<bool?> deleteProduct(String id) async {
   return await repository.delete(id);
  }

  @override
  Future<Product> updateProduct(String id, Product updatedItem) async {
   return await repository.update(id, updatedItem);
  }

}