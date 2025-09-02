import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoapp/models/task_model.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();

  AppDatabase._internal();

  factory AppDatabase() => _instance;

  Database? _database;
  String dbPathName = "todo.db";
  String tableName = "todo";

  Future<Database> get db async {
    if (_database != null) {
      print("db opened");
      return _database!;
    } else {
      _database = await openDb();
      print("db created");
      return _database!;
    }
  }

  Future<Database> openDb() async {
    print("Getting DB path...");
    var dbPath = await getDatabasesPath();
    print("DB path: $dbPath");
    String path = join(dbPath, dbPathName);
    print("Full path: $path");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
            CREATE TABLE $tableName( 
            id INTEGER PRIMARY KEY AUTOINCREMENT, 
            taskName TEXT NOT NULL,
            taskDescription TEXT NOT NULL,
            isFinished INTEGER NOT NULL,
            isPriority INTEGER NOT NULL
            );
''');
        print("table $tableName created!");
      },
    );
  }

  Future<List<TaskModel>> getTodos() async {
    print("Fetching todos...");
    final Database database = await db;
    final rows = await database.query(tableName);
    print("Rows fetched: $rows");
    return rows.map((e) => TaskModel.fromJson(e)).toList();
  }

  Future<int> insertTodo(TaskModel task) async {
    final Database database = await db;
    return await database.insert(
      tableName,
      task.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateTodp(TaskModel task) async {
    final Database database = await db;
    return await database.update(
      tableName,
      task.toJson(),
      where: "id = ?",
      whereArgs: [task.id],
    );

  }
}
