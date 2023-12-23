import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    databaseFactory = databaseFactoryFfi;
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }
  
  DatabaseFactory? get databaseFactoryFfi => null;

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'dbProjeto.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            email TEXT,
            password TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert('users', user);
    await printUsers(); // Para verificar os usuários no console
  }

  Future<void> printUsers() async {
    final db = await database;
    List<Map<String, dynamic>> users = await db.query('users');
    print('Usuários no banco de dados: $users');
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return await db.query('users');
  }
}