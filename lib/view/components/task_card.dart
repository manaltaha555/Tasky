import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/models/task_model.dart';
import 'package:todoapp/view/pages/task_page.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => TaskPage(task: task)));
      },
      leading: Checkbox(
        value: task.isFinished,
        activeColor: Color(0XFF15B86C),
        onChanged: (value) {
          context.read<TaskController>().add(
            ToggleTask(task: task.copyWith(isFinished: value ?? false)),
          );
        },
      ),
      title: Text(
        task.taskName,
        style: task.isFinished
            ? theme.bodyMedium!.copyWith(
                decoration: TextDecoration.lineThrough,
                decorationColor: Color(0XFFA0A0A0),
                decorationThickness: 2,
                color: Color(0XFFA0A0A0),
              )
            : theme.bodyMedium,
      ),
      subtitle: task.isPriority
          ? null
          : task.isFinished
          ? null
          : Text(task.taskDescription, style: theme.labelMedium),
      trailing: IconButton(
        icon: Icon(Icons.more_vert_rounded, color: Color(0XFFC6C6C6)),
        onPressed: () {},
      ),
    );
  }
}
