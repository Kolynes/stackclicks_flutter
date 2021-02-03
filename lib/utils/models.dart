import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../settings.dart' as settings;

abstract class Model {
  Map<String, dynamic> toMap();
  dynamic get primaryKey;
  String get primaryKeyName;
}

abstract class ModelManager<T extends Model> {
  static Database _database;
  String ordering;

  final String _tableName;

  ModelManager(this._tableName);

  Future<void> save(T model) async {
    return await _database.insert(_tableName, model.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> delete(T model) async {
    return await _database.delete(_tableName, where: "\"${model.primaryKeyName}\" = ?", whereArgs: [model.primaryKey]);
  }

  T fromMap(Map<String, dynamic> map);

  Future<T> get(Map<String, dynamic> lookup) async {
    List<String> whereClauses = [];
    List<dynamic> values = [];
    lookup.forEach((key, value) {
      whereClauses.add("\"$key\" = ?");
      values.add(value);
    });
    List<Map<String, dynamic>> maps = await _database.query(_tableName, distinct: true, where: whereClauses.join(" AND "), whereArgs: values, limit: 1);
    if(maps.length == 0)
      return null;
    return fromMap(maps[0]);
  }

  Future<List<T>> filter(Map<String, dynamic> lookup) async {
    List<String> whereClauses = [];
    List<dynamic> values = [];
    lookup.forEach((key, value) {
      whereClauses.add("\"$key\" = ?");
      values.add(value);
    });
    List<Map<String, dynamic>> maps = await _database.query(_tableName, where: whereClauses.join(" AND "), whereArgs: values, orderBy: ordering);
    return List.generate(maps.length, (index) => fromMap(maps[index]));
  }

  Future<List<T>> all() async {
    List<Map<String, dynamic>> maps = await _database.query(_tableName, orderBy: ordering);
    return List.generate(maps.length, (index){
      return fromMap(maps[index]);
    });
  }
  
  static String _generateSchema(Model model, String tableName){
    List<String> columnNames = [];
    model.toMap().forEach((key, value) {
      var type;
      switch(value.runtimeType) {
        case int:
          type = "INTEGER";
          break;
        case String:
          type = "TEXT";
          break;
        case num:
          type = "REAL";
          break;
        case List:
          type = "TEXT";
          break;
        case Map:
          type = "TEXT";
          break;
      }
      var primaryKeyClause = model.primaryKeyName == key? "PRIMARY KEY" : "";
      columnNames.add("\"$key\" $type $primaryKeyClause");
    });
    return "CREATE TABLE $tableName(${columnNames.join(', ')})";
  }

  static Future<void> registerModels(Map<String, Model> models) async {
    String dbPath = join(await getDatabasesPath(), settings.databaseName);
    // await deleteDatabase(dbPath);
    _database = await openDatabase(
      dbPath,
      onCreate: (database, version) {
        var batch = database.batch();
        models.forEach((String tableName, Model model) {
          batch.execute(_generateSchema(model, tableName));
        });
        batch.commit();
      },
      version: 1,
    );
  }
}
