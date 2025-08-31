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

  get db async {
    if (_database != null) {
      return _database;
    } else {
      _database = await openDb();
    }
  }

  Future<Database> openDb() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, dbPathName);

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
      },
    );
  }

  Future<void> insertTodo(TaskModel task) async {
    await db.insert(
      tableName,
      task.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TaskModel>> getTodos() async {
    final rows = await db.query(tableName);
    return rows.map((e) => TaskModel.fromJson(e));
  }
}
