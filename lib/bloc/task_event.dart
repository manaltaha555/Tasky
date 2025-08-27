
import 'package:todoapp/models/task_model.dart';

sealed class TaskEvent {}
class LoadTasks extends TaskEvent{
  List <TaskModel> tasks;
  LoadTasks({required this.tasks});
}
class AddTask extends TaskEvent{
  final String taskName;
  final String taskDescription;

  AddTask({required this.taskName, required this.taskDescription});
}
class ToggleTask extends TaskEvent {
  final TaskModel task;
  final bool isFinished;

  ToggleTask({required this.task, required this.isFinished});
}

class EditTask extends TaskEvent{
    final TaskModel task;
    final String taskName;
    final String taskDescription;
    EditTask({required this.task, required this.taskName, required this.taskDescription});

} 