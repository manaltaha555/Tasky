import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/core/components/task_card.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  @override
  void initState() {
    super.initState();
    context.read<TaskController>().add(LoadTasks(tasks: []));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Completed Tasks"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<TaskController, TaskState>(
          builder: (context, state) {
            switch (state) {
              case IsLoadingState():
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).indicatorColor,
                  ),
                );
              case IsLoadedState():
                final undoTasks = state.tasks
                    .where((t) => !t.isFinished)
                    .toList();
                if (undoTasks.isEmpty) {
                  return Center(
                    child: Text(
                      "What a great work!\n No unfinished tasks, let's start one.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: undoTasks.length,
                    itemBuilder: (context, index) =>
                        Card(child: TaskCard(task: undoTasks[index])),
                  );
                }
              case ErrorState():
                return Center(child: Text(state.message));
            }
          },
        ),
      ),
    );
  }
}
