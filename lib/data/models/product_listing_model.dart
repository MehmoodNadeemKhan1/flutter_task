import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_listing_model.freezed.dart';
part 'product_listing_model.g.dart';

@freezed
class Product with _$Product{
  const factory Product({
     String? id,
    required List<String> images,
    required String category,
    required String name,
    required String description,
    required int?   price,
    required bool isNegotiable,
    required String condition,
    required String location,
    required String material,
    required String color,
    String? addNote,
     String? createdAt,
}) = _Product;

  factory Product.fromJson(Map<String,dynamic>json)=>_$ProductFromJson(json);

}
