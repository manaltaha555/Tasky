import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/core/pages/task_page.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => TaskPage(task: task)));
      },
      leading: Checkbox(
        value: task.isFinished,
        onChanged: (value) {
          context.read<TaskController>().add(
            ToggleTask(task: task.copyWith(isFinished: value ?? false)),
          );
        },
      ),
      title: Text(
        task.taskName!,
        style: task.isFinished
            ? theme.textTheme.bodyMedium!.copyWith(
                decoration: TextDecoration.lineThrough,
                decorationColor: theme.disabledColor,
                decorationThickness: 2,
                color: theme.disabledColor,
              )
            : theme.textTheme.bodyMedium,
      ),
      subtitle: task.isPriority
          ? null
          : task.isFinished
          ? null
          : Text(task.taskDescription!, style: theme.textTheme.labelMedium),
      trailing: PopupMenuButton(
        icon: Icon(Icons.more_vert_rounded, color: Color(0XFFC6C6C6)),
        onSelected: (value) async {
          if (value == "delete") {
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: theme.scaffoldBackgroundColor,
                title: Text(
                  "Delete the task",
                  style: theme.textTheme.bodyMedium,
                ),
                content: Text(
                  "Are you sure you want to delete this task?",
                  style: theme.textTheme.bodyMedium,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      context.read<TaskController>().add(
                        DeleteTask(task: task),
                      );
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "delete",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.disabledColor,
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "cancel",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Color(0XFF15B86C),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(15)),
                ),
              ),
            );
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: "delete",
            child: Text('delete', style: theme.textTheme.labelMedium),
          ),
        ],
      ),
    );
  }
}
