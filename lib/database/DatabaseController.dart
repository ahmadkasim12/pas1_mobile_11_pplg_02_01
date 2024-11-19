import 'package:get/get.dart';
import 'package:pas1_mobile_11_pplg_02_01/database/FavoritedModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'DatabaseModel.dart';

class DatabaseController extends GetxController {
  static Database? _db;
  var tokenSessions = <DatabaseModel>[].obs;
  var favoritedGames = <FavoritedModel>[].obs;

  Future<Database?> get db async {
    _db ??= await initDB();
    return _db;
  }

  Future<Database> initDB() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'db_sport.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
         CREATE TABLE user (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          token TEXT
        )
        CREATE TABLE favorited (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          token TEXT
        )
        ''');
      },
    );
  }

  Future<void> addTask(String token) async {
    var dbClient = await db;
    await dbClient!.execute('INSERT INTO user (token) VALUES (?)', [token]);
  }

  Future<int> addFavorited(FavoritedModel task) async {
    var dbClient = await db;
    int result = await dbClient!.insert('favorited', task.toMap());
    loadTasks();
    return result;
  }

  Future<void> loadTasks() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('user');
    tokenSessions.assignAll(await queryResult.map((data) => DatabaseModel.fromMap(data)).toList());
  }

  Future<void> loadFavoritedGame() async {
    var dbClient = await db;
    List<Map<String, dynamic>> queryResult = await dbClient!.query('favorited');
    favoritedGames.assignAll(await queryResult.map((data) => FavoritedModel.fromMap(data)).toList());
  }
}