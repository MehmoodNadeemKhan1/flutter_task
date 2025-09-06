// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String? get id => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int? get price => throw _privateConstructorUsedError;
  bool get isNegotiable => throw _privateConstructorUsedError;
  String get condition => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get material => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  String? get addNote => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    String? id,
    List<String> images,
    String category,
    String name,
    String description,
    int? price,
    bool isNegotiable,
    String condition,
    String location,
    String material,
    String color,
    String? addNote,
    String? createdAt,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? images = null,
    Object? category = null,
    Object? name = null,
    Object? description = null,
    Object? price = freezed,
    Object? isNegotiable = null,
    Object? condition = null,
    Object? location = null,
    Object? material = null,
    Object? color = null,
    Object? addNote = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: freezed == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String?,
            images: null == images
                ? _value.images
                : images // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            category: null == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as int?,
            isNegotiable: null == isNegotiable
                ? _value.isNegotiable
                : isNegotiable // ignore: cast_nullable_to_non_nullable
                      as bool,
            condition: null == condition
                ? _value.condition
                : condition // ignore: cast_nullable_to_non_nullable
                      as String,
            location: null == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String,
            material: null == material
                ? _value.material
                : material // ignore: cast_nullable_to_non_nullable
                      as String,
            color: null == color
                ? _value.color
                : color // ignore: cast_nullable_to_non_nullable
                      as String,
            addNote: freezed == addNote
                ? _value.addNote
                : addNote // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? id,
    List<String> images,
    String category,
    String name,
    String description,
    int? price,
    bool isNegotiable,
    String condition,
    String location,
    String material,
    String color,
    String? addNote,
    String? createdAt,
  });
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? images = null,
    Object? category = null,
    Object? name = null,
    Object? description = null,
    Object? price = freezed,
    Object? isNegotiable = null,
    Object? condition = null,
    Object? location = null,
    Object? material = null,
    Object? color = null,
    Object? addNote = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$ProductImpl(
        id: freezed == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        images: null == images
            ? _value._images
            : images // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        category: null == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as int?,
        isNegotiable: null == isNegotiable
            ? _value.isNegotiable
            : isNegotiable // ignore: cast_nullable_to_non_nullable
                  as bool,
        condition: null == condition
            ? _value.condition
            : condition // ignore: cast_nullable_to_non_nullable
                  as String,
        location: null == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String,
        material: null == material
            ? _value.material
            : material // ignore: cast_nullable_to_non_nullable
                  as String,
        color: null == color
            ? _value.color
            : color // ignore: cast_nullable_to_non_nullable
                  as String,
        addNote: freezed == addNote
            ? _value.addNote
            : addNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl({
    this.id,
    required final List<String> images,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.isNegotiable,
    required this.condition,
    required this.location,
    required this.material,
    required this.color,
    this.addNote,
    this.createdAt,
  }) : _images = images;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String? id;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final String category;
  @override
  final String name;
  @override
  final String description;
  @override
  final int? price;
  @override
  final bool isNegotiable;
  @override
  final String condition;
  @override
  final String location;
  @override
  final String material;
  @override
  final String color;
  @override
  final String? addNote;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'Product(id: $id, images: $images, category: $category, name: $name, description: $description, price: $price, isNegotiable: $isNegotiable, condition: $condition, location: $location, material: $material, color: $color, addNote: $addNote, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isNegotiable, isNegotiable) ||
                other.isNegotiable == isNegotiable) &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.addNote, addNote) || other.addNote == addNote) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    const DeepCollectionEquality().hash(_images),
    category,
    name,
    description,
    price,
    isNegotiable,
    condition,
    location,
    material,
    color,
    addNote,
    createdAt,
  );

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product({
    final String? id,
    required final List<String> images,
    required final String category,
    required final String name,
    required final String description,
    required final int? price,
    required final bool isNegotiable,
    required final String condition,
    required final String location,
    required final String material,
    required final String color,
    final String? addNote,
    final String? createdAt,
  }) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String? get id;
  @override
  List<String> get images;
  @override
  String get category;
  @override
  String get name;
  @override
  String get description;
  @override
  int? get price;
  @override
  bool get isNegotiable;
  @override
  String get condition;
  @override
  String get location;
  @override
  String get material;
  @override
  String get color;
  @override
  String? get addNote;
  @override
  String? get createdAt;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
