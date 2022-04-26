import 'dart:convert';
import 'package:publication_app/features/cart/cart_viewmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class CartService {
  final String tableName = 'cart';
  Database database;
  Future openDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'cart.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE $tableName(
            id INTEGER PRIMARY KEY,
            name TEXT,
            author TEXT,
            price INTEGER,
            type Text,
            image TEXT,
            quantity INTEGER
            )''',
        );
      },
      version: 2,
    );
  }

  Future<void> addToDB(CartItem item) async {
    //
    if (database == null) {
      await openDB();
    }
    var map = item.toMap();
    print(item.id);
    print(map);
    print(jsonEncode(map));
    await database.insert(tableName, map);
  }

  updateToDB(CartItem item) async {
    //
    if (database == null) {
      await openDB();
    }
    var map = item.toMap();
    print(item.id);
    print(map);
    print(jsonEncode(map));
    await database.update(tableName, map);
  }

  queryItemDB(id) async {
    if (database == null) {
      await openDB();
    }

    var data = await database.query(tableName, where: "id=?", whereArgs: [id]);
    // print(data);
    if (data.length > 0) return true;
    return false;
  }

  Future<List<CartItem>> getFromDB() async {
    //
    if (database == null) {
      await openDB();
    }
    var data = await database.query(tableName);

    List<CartItem> products = [];
    for (var p in data) {
      products.add(cartItemFromMap(jsonEncode(p)));
    }

    return products;
  }

  Future<void> deleteFromDB(int id) async {
    //
    if (database == null) {
      await openDB();
    }
    await database.delete(tableName, where: "id=?", whereArgs: [id]);
  }
}
