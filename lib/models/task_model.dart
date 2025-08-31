class TaskModel {
  final int? id;
  final String taskName;
  final String taskDescription;
  final bool isFinished;
  final bool isPriority;

  TaskModel({ 
    this.id = 0,
    required this.taskName,
    required this.taskDescription,
    this.isFinished = false,
    this.isPriority = false,
  });

  Map<String, dynamic> toJson() {
    return {
      "id" : id,
      "taskName": taskName,
      "isFinished": isFinished,
      "isPriority": isPriority,
      "taskDescription": taskDescription,

    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id : json["id"],
      taskName: json["taskName"],
      taskDescription: json["taskDescription"],
      isFinished: json["isFinished"] == 1 ? true : false,
      isPriority: json["isPriority"] == 1 ? true : false,
    );
  }

  
}
