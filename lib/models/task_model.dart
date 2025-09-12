import 'package:hive_ce_flutter/hive_flutter.dart';
part 'task_model.g.dart'; 

@HiveType(typeId: 0) // لازم كل model ليه typeId مختلف
class TaskModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? taskName;

  @HiveField(2)
  String? taskDescription;

  @HiveField(3)
  bool isFinished;

  @HiveField(4)
  bool isPriority;

  TaskModel({
    this.id,
    this.taskName,
    this.taskDescription,
    this.isFinished = false,
    this.isPriority = false,
  });

  TaskModel copyWith({
    int? id,
    String? taskName,
    String? taskDescription,
    bool? isFinished,
    bool? isPriority,
  }) {
    return TaskModel(
      id: id ?? this.id,
      taskName: taskName ?? this.taskName,
      taskDescription: taskDescription ?? this.taskDescription,
      isFinished: isFinished ?? this.isFinished,
      isPriority: isPriority ?? this.isPriority,
    );
  }
}
