// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_listing_app_database.dart';

// ignore_for_file: type=lint
class $ProductListingTableTable extends ProductListingTable
    with TableInfo<$ProductListingTableTable, ProductDB> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductListingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<List<String>, String> images =
      GeneratedColumn<String>(
        'images',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<List<String>>($ProductListingTableTable.$converterimages);
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<int> price = GeneratedColumn<int>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isNegotiableMeta = const VerificationMeta(
    'isNegotiable',
  );
  @override
  late final GeneratedColumn<bool> isNegotiable = GeneratedColumn<bool>(
    'is_negotiable',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_negotiable" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _materialMeta = const VerificationMeta(
    'material',
  );
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
    'material',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addNoteMeta = const VerificationMeta(
    'addNote',
  );
  @override
  late final GeneratedColumn<String> addNote = GeneratedColumn<String>(
    'add_note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<String> createdAt = GeneratedColumn<String>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    images,
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
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_listing_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductDB> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('is_negotiable')) {
      context.handle(
        _isNegotiableMeta,
        isNegotiable.isAcceptableOrUnknown(
          data['is_negotiable']!,
          _isNegotiableMeta,
        ),
      );
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('material')) {
      context.handle(
        _materialMeta,
        material.isAcceptableOrUnknown(data['material']!, _materialMeta),
      );
    } else if (isInserting) {
      context.missing(_materialMeta);
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    } else if (isInserting) {
      context.missing(_colorMeta);
    }
    if (data.containsKey('add_note')) {
      context.handle(
        _addNoteMeta,
        addNote.isAcceptableOrUnknown(data['add_note']!, _addNoteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductDB map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductDB(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      images: $ProductListingTableTable.$converterimages.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}images'],
        )!,
      ),
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}price'],
      )!,
      isNegotiable: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_negotiable'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      )!,
      material: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material'],
      )!,
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      )!,
      addNote: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}add_note'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ProductListingTableTable createAlias(String alias) {
    return $ProductListingTableTable(attachedDatabase, alias);
  }

  static TypeConverter<List<String>, String> $converterimages =
      const CidListConverter();
}

class ProductDB extends DataClass implements Insertable<ProductDB> {
  final String id;
  final List<String> images;
  final String category;
  final String name;
  final String description;
  final int price;
  final bool isNegotiable;
  final String condition;
  final String location;
  final String material;
  final String color;
  final String? addNote;
  final String createdAt;
  const ProductDB({
    required this.id,
    required this.images,
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
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['images'] = Variable<String>(
        $ProductListingTableTable.$converterimages.toSql(images),
      );
    }
    map['category'] = Variable<String>(category);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    map['price'] = Variable<int>(price);
    map['is_negotiable'] = Variable<bool>(isNegotiable);
    map['condition'] = Variable<String>(condition);
    map['location'] = Variable<String>(location);
    map['material'] = Variable<String>(material);
    map['color'] = Variable<String>(color);
    if (!nullToAbsent || addNote != null) {
      map['add_note'] = Variable<String>(addNote);
    }
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  ProductListingTableCompanion toCompanion(bool nullToAbsent) {
    return ProductListingTableCompanion(
      id: Value(id),
      images: Value(images),
      category: Value(category),
      name: Value(name),
      description: Value(description),
      price: Value(price),
      isNegotiable: Value(isNegotiable),
      condition: Value(condition),
      location: Value(location),
      material: Value(material),
      color: Value(color),
      addNote: addNote == null && nullToAbsent
          ? const Value.absent()
          : Value(addNote),
      createdAt: Value(createdAt),
    );
  }

  factory ProductDB.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductDB(
      id: serializer.fromJson<String>(json['id']),
      images: serializer.fromJson<List<String>>(json['images']),
      category: serializer.fromJson<String>(json['category']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      price: serializer.fromJson<int>(json['price']),
      isNegotiable: serializer.fromJson<bool>(json['isNegotiable']),
      condition: serializer.fromJson<String>(json['condition']),
      location: serializer.fromJson<String>(json['location']),
      material: serializer.fromJson<String>(json['material']),
      color: serializer.fromJson<String>(json['color']),
      addNote: serializer.fromJson<String?>(json['addNote']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'images': serializer.toJson<List<String>>(images),
      'category': serializer.toJson<String>(category),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'price': serializer.toJson<int>(price),
      'isNegotiable': serializer.toJson<bool>(isNegotiable),
      'condition': serializer.toJson<String>(condition),
      'location': serializer.toJson<String>(location),
      'material': serializer.toJson<String>(material),
      'color': serializer.toJson<String>(color),
      'addNote': serializer.toJson<String?>(addNote),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  ProductDB copyWith({
    String? id,
    List<String>? images,
    String? category,
    String? name,
    String? description,
    int? price,
    bool? isNegotiable,
    String? condition,
    String? location,
    String? material,
    String? color,
    Value<String?> addNote = const Value.absent(),
    String? createdAt,
  }) => ProductDB(
    id: id ?? this.id,
    images: images ?? this.images,
    category: category ?? this.category,
    name: name ?? this.name,
    description: description ?? this.description,
    price: price ?? this.price,
    isNegotiable: isNegotiable ?? this.isNegotiable,
    condition: condition ?? this.condition,
    location: location ?? this.location,
    material: material ?? this.material,
    color: color ?? this.color,
    addNote: addNote.present ? addNote.value : this.addNote,
    createdAt: createdAt ?? this.createdAt,
  );
  ProductDB copyWithCompanion(ProductListingTableCompanion data) {
    return ProductDB(
      id: data.id.present ? data.id.value : this.id,
      images: data.images.present ? data.images.value : this.images,
      category: data.category.present ? data.category.value : this.category,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
      price: data.price.present ? data.price.value : this.price,
      isNegotiable: data.isNegotiable.present
          ? data.isNegotiable.value
          : this.isNegotiable,
      condition: data.condition.present ? data.condition.value : this.condition,
      location: data.location.present ? data.location.value : this.location,
      material: data.material.present ? data.material.value : this.material,
      color: data.color.present ? data.color.value : this.color,
      addNote: data.addNote.present ? data.addNote.value : this.addNote,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductDB(')
          ..write('id: $id, ')
          ..write('images: $images, ')
          ..write('category: $category, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('isNegotiable: $isNegotiable, ')
          ..write('condition: $condition, ')
          ..write('location: $location, ')
          ..write('material: $material, ')
          ..write('color: $color, ')
          ..write('addNote: $addNote, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    images,
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
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductDB &&
          other.id == this.id &&
          other.images == this.images &&
          other.category == this.category &&
          other.name == this.name &&
          other.description == this.description &&
          other.price == this.price &&
          other.isNegotiable == this.isNegotiable &&
          other.condition == this.condition &&
          other.location == this.location &&
          other.material == this.material &&
          other.color == this.color &&
          other.addNote == this.addNote &&
          other.createdAt == this.createdAt);
}

class ProductListingTableCompanion extends UpdateCompanion<ProductDB> {
  final Value<String> id;
  final Value<List<String>> images;
  final Value<String> category;
  final Value<String> name;
  final Value<String> description;
  final Value<int> price;
  final Value<bool> isNegotiable;
  final Value<String> condition;
  final Value<String> location;
  final Value<String> material;
  final Value<String> color;
  final Value<String?> addNote;
  final Value<String> createdAt;
  final Value<int> rowid;
  const ProductListingTableCompanion({
    this.id = const Value.absent(),
    this.images = const Value.absent(),
    this.category = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.price = const Value.absent(),
    this.isNegotiable = const Value.absent(),
    this.condition = const Value.absent(),
    this.location = const Value.absent(),
    this.material = const Value.absent(),
    this.color = const Value.absent(),
    this.addNote = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductListingTableCompanion.insert({
    required String id,
    required List<String> images,
    required String category,
    required String name,
    required String description,
    required int price,
    this.isNegotiable = const Value.absent(),
    required String condition,
    required String location,
    required String material,
    required String color,
    this.addNote = const Value.absent(),
    required String createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       images = Value(images),
       category = Value(category),
       name = Value(name),
       description = Value(description),
       price = Value(price),
       condition = Value(condition),
       location = Value(location),
       material = Value(material),
       color = Value(color),
       createdAt = Value(createdAt);
  static Insertable<ProductDB> custom({
    Expression<String>? id,
    Expression<String>? images,
    Expression<String>? category,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? price,
    Expression<bool>? isNegotiable,
    Expression<String>? condition,
    Expression<String>? location,
    Expression<String>? material,
    Expression<String>? color,
    Expression<String>? addNote,
    Expression<String>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (images != null) 'images': images,
      if (category != null) 'category': category,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (price != null) 'price': price,
      if (isNegotiable != null) 'is_negotiable': isNegotiable,
      if (condition != null) 'condition': condition,
      if (location != null) 'location': location,
      if (material != null) 'material': material,
      if (color != null) 'color': color,
      if (addNote != null) 'add_note': addNote,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductListingTableCompanion copyWith({
    Value<String>? id,
    Value<List<String>>? images,
    Value<String>? category,
    Value<String>? name,
    Value<String>? description,
    Value<int>? price,
    Value<bool>? isNegotiable,
    Value<String>? condition,
    Value<String>? location,
    Value<String>? material,
    Value<String>? color,
    Value<String?>? addNote,
    Value<String>? createdAt,
    Value<int>? rowid,
  }) {
    return ProductListingTableCompanion(
      id: id ?? this.id,
      images: images ?? this.images,
      category: category ?? this.category,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      isNegotiable: isNegotiable ?? this.isNegotiable,
      condition: condition ?? this.condition,
      location: location ?? this.location,
      material: material ?? this.material,
      color: color ?? this.color,
      addNote: addNote ?? this.addNote,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (images.present) {
      map['images'] = Variable<String>(
        $ProductListingTableTable.$converterimages.toSql(images.value),
      );
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (price.present) {
      map['price'] = Variable<int>(price.value);
    }
    if (isNegotiable.present) {
      map['is_negotiable'] = Variable<bool>(isNegotiable.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (addNote.present) {
      map['add_note'] = Variable<String>(addNote.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductListingTableCompanion(')
          ..write('id: $id, ')
          ..write('images: $images, ')
          ..write('category: $category, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('price: $price, ')
          ..write('isNegotiable: $isNegotiable, ')
          ..write('condition: $condition, ')
          ..write('location: $location, ')
          ..write('material: $material, ')
          ..write('color: $color, ')
          ..write('addNote: $addNote, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductListingTableTable productListingTable =
      $ProductListingTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productListingTable];
}

typedef $$ProductListingTableTableCreateCompanionBuilder =
    ProductListingTableCompanion Function({
      required String id,
      required List<String> images,
      required String category,
      required String name,
      required String description,
      required int price,
      Value<bool> isNegotiable,
      required String condition,
      required String location,
      required String material,
      required String color,
      Value<String?> addNote,
      required String createdAt,
      Value<int> rowid,
    });
typedef $$ProductListingTableTableUpdateCompanionBuilder =
    ProductListingTableCompanion Function({
      Value<String> id,
      Value<List<String>> images,
      Value<String> category,
      Value<String> name,
      Value<String> description,
      Value<int> price,
      Value<bool> isNegotiable,
      Value<String> condition,
      Value<String> location,
      Value<String> material,
      Value<String> color,
      Value<String?> addNote,
      Value<String> createdAt,
      Value<int> rowid,
    });

class $$ProductListingTableTableFilterComposer
    extends Composer<_$AppDatabase, $ProductListingTableTable> {
  $$ProductListingTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<List<String>, List<String>, String>
  get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isNegotiable => $composableBuilder(
    column: $table.isNegotiable,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addNote => $composableBuilder(
    column: $table.addNote,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductListingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductListingTableTable> {
  $$ProductListingTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get images => $composableBuilder(
    column: $table.images,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isNegotiable => $composableBuilder(
    column: $table.isNegotiable,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addNote => $composableBuilder(
    column: $table.addNote,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductListingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductListingTableTable> {
  $$ProductListingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<List<String>, String> get images =>
      $composableBuilder(column: $table.images, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<bool> get isNegotiable => $composableBuilder(
    column: $table.isNegotiable,
    builder: (column) => column,
  );

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get addNote =>
      $composableBuilder(column: $table.addNote, builder: (column) => column);

  GeneratedColumn<String> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$ProductListingTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductListingTableTable,
          ProductDB,
          $$ProductListingTableTableFilterComposer,
          $$ProductListingTableTableOrderingComposer,
          $$ProductListingTableTableAnnotationComposer,
          $$ProductListingTableTableCreateCompanionBuilder,
          $$ProductListingTableTableUpdateCompanionBuilder,
          (
            ProductDB,
            BaseReferences<_$AppDatabase, $ProductListingTableTable, ProductDB>,
          ),
          ProductDB,
          PrefetchHooks Function()
        > {
  $$ProductListingTableTableTableManager(
    _$AppDatabase db,
    $ProductListingTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductListingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductListingTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$ProductListingTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<List<String>> images = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> price = const Value.absent(),
                Value<bool> isNegotiable = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> material = const Value.absent(),
                Value<String> color = const Value.absent(),
                Value<String?> addNote = const Value.absent(),
                Value<String> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductListingTableCompanion(
                id: id,
                images: images,
                category: category,
                name: name,
                description: description,
                price: price,
                isNegotiable: isNegotiable,
                condition: condition,
                location: location,
                material: material,
                color: color,
                addNote: addNote,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required List<String> images,
                required String category,
                required String name,
                required String description,
                required int price,
                Value<bool> isNegotiable = const Value.absent(),
                required String condition,
                required String location,
                required String material,
                required String color,
                Value<String?> addNote = const Value.absent(),
                required String createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ProductListingTableCompanion.insert(
                id: id,
                images: images,
                category: category,
                name: name,
                description: description,
                price: price,
                isNegotiable: isNegotiable,
                condition: condition,
                location: location,
                material: material,
                color: color,
                addNote: addNote,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductListingTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductListingTableTable,
      ProductDB,
      $$ProductListingTableTableFilterComposer,
      $$ProductListingTableTableOrderingComposer,
      $$ProductListingTableTableAnnotationComposer,
      $$ProductListingTableTableCreateCompanionBuilder,
      $$ProductListingTableTableUpdateCompanionBuilder,
      (
        ProductDB,
        BaseReferences<_$AppDatabase, $ProductListingTableTable, ProductDB>,
      ),
      ProductDB,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductListingTableTableTableManager get productListingTable =>
      $$ProductListingTableTableTableManager(_db, _db.productListingTable);
}
