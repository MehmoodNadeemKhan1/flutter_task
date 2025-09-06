import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_task/data/models/product_listing_model.dart';
import 'package:uuid/uuid.dart';
import '../models/product_listing_table.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'product_listing_app_database.g.dart';

@DriftDatabase(tables: [ProductListingTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertProduct(ProductListingTableCompanion entry) =>
      into(productListingTable).insert(entry);

  Future<List<ProductDB>> getAllProducts() =>
      select(productListingTable).get();

  // Update
  Future<bool> updateProduct(Product products) =>
      update(productListingTable).replace(products as Insertable<ProductDB>);

  // Delete
  Future<int> deleteProduct(String id) =>
      (delete(productListingTable)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'my_sqlite_db.db'));
    print("DB Path: ${file.path}");
    return NativeDatabase(file, setup: (db) {
      db.execute('PRAGMA foreign_keys = ON');
    });
  });
}
