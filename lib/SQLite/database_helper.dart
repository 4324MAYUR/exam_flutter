import 'package:exam_app/JSON/users.dart';
import 'package:exam_app/routes/routes.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  final databaseName = "auth.db";

  // Authentication Table
  String userTable = '''
    CREATE TABLE users (
      usrId INTEGER PRIMARY KEY AUTOINCREMENT,
      fullName TEXT,
      email TEXT UNIQUE,
      usrName TEXT UNIQUE,
      usrPassword TEXT
    )
  ''';

  // User Data Table
  String userDataTable = '''
    CREATE TABLE user_data (
      usrId INTEGER PRIMARY KEY AUTOINCREMENT,
      fullName TEXT,
      email TEXT,
      usrPassword TEXT
    )
  ''';

  //  InitDB
  Future<Database> initDB() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, databaseName);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(userTable);
      await db.execute(userDataTable);
    });
  }

  //  Authentication - Login Method
  Future<bool> authenticateUser(String email, String password) async {
    final Database db = await initDB();
    var result = await db.query(
      "users",
      where: "email = ? AND usrPassword = ?",
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  //  Authentication - Signup
  Future<int> createUser(Users usr) async {
    final Database db = await initDB();
    return db.insert("users", usr.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  //  Logout Method
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', false);
    Get.offAllNamed(GetRoutes.login);
  }

  //  Insert User Data
  Future<int> insertUser(String fullName, String email, String password) async {
    final Database db = await initDB();
    return await db.insert(
      "user_data",
      {
        "fullName": fullName,
        "email": email,
        "usrPassword": password,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //  Fetch Data user_data Table
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final Database db = await initDB();
    return await db.query("user_data");
  }

  // Delete User Data
  Future<int> deleteUser(int usrId) async {
    final Database db = await initDB();
    return await db.delete(
      "user_data",
      where: "usrId = ?",
      whereArgs: [usrId],
    );
  }

  // update User Data
  Future<int> updateUser(int userId, String name, String email, String password) async {
    final Database db = await initDB();
    return await db.update(
      "user_data",
      {
        "fullName": name,
        "email": email,
        "usrPassword": password,
      },
      where: "usrId = ?",
      whereArgs: [userId],
    );
  }

}
