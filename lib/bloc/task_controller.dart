import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/services/app_database.dart';

class TaskController extends Bloc<TaskEvent, TaskState> {
  List<TaskModel> _tasks = [];

  TaskController() : super(IsLoadingState()) {

    on<LoadTasks>((event, emit) async {
      emit(IsLoadingState());
      await Future.delayed(Duration(milliseconds: 500));
      try {
        _tasks = await AppDatabase().getTodos();
        emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<AddTask>((event, emit) async {
      emit(IsLoadingState());
      Future.delayed(Duration(milliseconds: 500));
      try {
        final id = await AppDatabase().insertTodo(event.task);
        _tasks.add(event.task.copyWith(id: id));
        emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });

    on<ToggleTask>((event, emit) async {
        await AppDatabase().updateTodp(event.task);
        final index = _tasks.indexWhere((t) => t.id == event.task.id);
        _tasks[index] = _tasks[index].copyWith(isFinished: event.task.isFinished);
        emit(IsLoadedState(List.from(_tasks)));
    });
    
    on<EditTask>((event, emit) async {
      emit(IsLoadingState());
      Future.delayed(Duration(milliseconds: 500));
      try {
        await AppDatabase().updateTodp(event.task);
        final index = _tasks.indexWhere((t) => t.id == event.task.id);
        _tasks[index].copyWith(
          taskName: event.task.taskName,
          taskDescription: event.task.taskDescription,
          isPriority: event.task.isPriority,
        );
        emit(IsLoadedState(List.from(_tasks)));
      } catch (e) {
        emit(ErrorState("$e"));
      }
    });
  }
}
