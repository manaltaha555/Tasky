import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/core/components/task_card.dart';

class CompletedPage extends StatefulWidget {
  const CompletedPage({super.key});

  @override
  State<CompletedPage> createState() => _CompletedPageState();
}

class _CompletedPageState extends State<CompletedPage> {
  @override
  void initState() {
    super.initState();
    context.read<TaskController>().add(LoadTasks(tasks: []));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("To Do Tasks"), centerTitle: true),
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
                    .where((t) => t.isFinished)
                    .toList();
                if (undoTasks.isEmpty) {
                  return Center(
                    child: Text(
                      "What are you waiting for?\nJust go and finish your tasks!",
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
