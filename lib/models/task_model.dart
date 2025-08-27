class TaskModel {
  String taskName;
  String taskDescription;
  bool isFinished;
  TaskModel({
    required this.taskName,
    required this.taskDescription,
    this.isFinished = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "taskName": taskName,
      "taskDescription": taskDescription,
      "isFinished": isFinished,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json["taskName"],
      taskDescription: json["taskDescription"],
      isFinished: json["isFinished"] ?? false,
    );
  }
}
