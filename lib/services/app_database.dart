import 'package:hive_ce/hive.dart';
import 'package:todoapp/models/task_model.dart';

class TaskHiveService {
  
static Future<Box<TaskModel>> openTaskBox() async {
    if (!Hive.isBoxOpen('tasksBox')) {
      return await Hive.openBox<TaskModel>("tasksBox");
    }
    return Hive.box<TaskModel>("tasksBox");
  }

  Future<List<TaskModel>> getTodos() async {
    final box = await  openTaskBox();
    return box.values.toList();
  }

  Future<int> insertTodo(TaskModel task) async {
    final box = await  openTaskBox();
    return await box.add(task); 
  }

  Future<void> updateTodo(int key, TaskModel task) async {
    final box = await  openTaskBox();
    await box.put(key, task);
  }

  Future<void> deleteTodo(int key) async {
    final box = await  openTaskBox();
    await box.delete(key);
  }
}
