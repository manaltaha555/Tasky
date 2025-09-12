import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/services/app_database.dart';

class TaskController extends Bloc<TaskEvent, TaskState> {
  final TaskHiveService _taskService = TaskHiveService();
  List<TaskModel> _tasks = [];

  TaskController() : super(IsLoadingState()) {
    on<LoadTasks>((event, emit) async {
      emit(IsLoadingState());
      await Future.delayed(Duration(milliseconds: 300));
      try {
        _tasks = await _taskService.getTodos();
        emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<AddTask>((event, emit) async {
      emit(IsLoadingState());
      await Future.delayed(Duration(milliseconds: 300));
      try {
        final id = await _taskService.insertTodo(event.task);
        _tasks.add(event.task.copyWith(id: id));
        emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<ToggleTask>((event, emit) async {
      final index = _tasks.indexWhere((t) => t.id == event.task.id);
      final updated = _tasks[index].copyWith(isFinished: event.task.isFinished);
      await _taskService.updateTodo(event.task.id!, updated);
      _tasks[index] = updated;
      emit(IsLoadedState(List.from(_tasks)));
    });

    on<EditTask>((event, emit) async {
      emit(IsLoadingState());
      await Future.delayed(Duration(milliseconds: 300));
      try {
        final index = _tasks.indexWhere((t) => t.id == event.task.id);
        final updated = event.task;
        await _taskService.updateTodo(event.task.id!, updated);
        _tasks[index] = updated;
        emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<DeleteTask>((event, emit) async{
      final index = _tasks.indexWhere((t) => t.id == event.task.id);
      await _taskService.deleteTodo(event.task.id!);
      _tasks.remove(_tasks[index]);
      emit(IsLoadedState(List.from(_tasks)));
    });

  }
}
