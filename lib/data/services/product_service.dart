import 'dart:io';

import 'package:flutter_task/data/models/product_listing_model.dart';
import 'package:flutter_task/data/repositories/implementation_interface.dart';
import 'package:flutter_task/data/services/service_interface.dart';
import 'package:flutter_task/data/utils/Pinata_service.dart';


class ProductService implements IService<Product>{
  final IRepository<Product> repository;
  ProductService(this.repository, this.pinataService);
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
      images: urls,
    );
    return await repository.create(productWithId);
  }

  @override
  Future<bool?> deleteProduct(String id) async {
   return await repository.delete(id);
  }

  @override
  Future<Product> updateProduct(String id, Product updatedItem,{List<File>? files}) async {
    List<String> urls = [];
    if (files != null && files.isNotEmpty) {
      urls = await pinataService.uploadFiles(files);
    }
    final productWithimage = updatedItem.copyWith(
      images: urls,
    );
   return await repository.update(id, productWithimage);
  }

  @override
  Future<Product?> singleProduct(String id) async {

    return await repository.findByID(id);
  }

}