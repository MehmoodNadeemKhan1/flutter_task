import 'dart:convert';

import 'package:drift/drift.dart';


@DataClassName('ProductDB')
class ProductListingTable extends Table {
  TextColumn get id => text()();
  TextColumn get images => text().map(const CidListConverter())();
  TextColumn get category => text()();
  TextColumn get name => text()();
  TextColumn get description => text()();
  IntColumn get price => integer()();
  BoolColumn get isNegotiable => boolean().withDefault(const Constant(false))();
  TextColumn get condition => text()();
  TextColumn get location => text()();
  TextColumn get material => text()();
  TextColumn get color => text()();
  TextColumn get addNote => text().nullable()();
  TextColumn get createdAt => text()();

  @override
  Set<Column> get primaryKey => {id};
}

class CidListConverter extends TypeConverter<List<String>, String> {
  const CidListConverter();

  @override
  List<String> fromSql(String fromDb) {
    if (fromDb.isEmpty) return [];
    return List<String>.from(jsonDecode(fromDb));
  }

  @override
  String toSql(List<String> value) {
    return jsonEncode(value);
  }
}

