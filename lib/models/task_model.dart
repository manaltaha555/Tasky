class TaskModel {
  final int? id;
  final String taskName;
  final String taskDescription;
  final bool isFinished;
  final bool isPriority;

  TaskModel({
    this.id,
    required this.taskName,
    required this.taskDescription,
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

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "taskName": taskName,
      "isFinished": isFinished ? 1 : 0,
      "isPriority": isPriority ? 1 : 0,
      "taskDescription": taskDescription,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json["id"],
      taskName: json["taskName"],
      taskDescription: json["taskDescription"],
      isFinished: json["isFinished"] == 1,
      isPriority: json["isPriority"] == 1,
    );
  }
}
