// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      category: json['category'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num?)?.toInt(),
      isNegotiable: json['isNegotiable'] as bool,
      condition: json['condition'] as String,
      location: json['location'] as String,
      material: json['material'] as String,
      color: json['color'] as String,
      addNote: json['addNote'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'category': instance.category,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'isNegotiable': instance.isNegotiable,
      'condition': instance.condition,
      'location': instance.location,
      'material': instance.material,
      'color': instance.color,
      'addNote': instance.addNote,
      'createdAt': instance.createdAt,
    };
