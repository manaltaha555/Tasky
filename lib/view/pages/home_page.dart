import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/view/pages/task_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/manal.jpg"),
                    radius: 42,
                  ),
                  title: Text(
                    "Good Evening $userName",
                    style: theme.displayMedium,
                  ),
                  subtitle: Text(
                    "One task at a time.One step closer.",
                    style: theme.labelMedium,
                  ),
                  trailing: GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: Color(0XFF2A2A2A),
                      child: SvgPicture.asset("assets/icons/sun.svg"),
                    ),
                  ),
                ),
              ),
              Text("Yuhuu ,Your work is ", style: theme.headlineLarge),
              Row(
                children: [
                  Text("almost done!  ", style: theme.headlineLarge),
                  SvgPicture.asset("assets/icons/wave.svg"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "My Tasks",
                  style: theme.headlineSmall?.copyWith(fontSize: 20),
                ),
              ),
              Expanded(
                child: BlocBuilder<TaskController, TaskState>(
                  builder: (context, state) {
                    switch (state) {
                      case IsLoadingState():
                        return Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      case IsLoadedState():
                        if (state.tasks.isEmpty) {
                          return Center(
                            child: Text(
                              "No Tasks Yet, Try Adding One!",
                              style: theme.bodyMedium,
                            ),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: state.tasks.length,
                            itemBuilder: (context, index) {
                              return Card(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                color: Color(0XFF2A2A2A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: ListTile(
                                  leading: Checkbox(
                                    value: state.tasks[index].isFinished,
                                    activeColor: Color(0XFF15B86C),
                                    onChanged: (value) {
                                      context.read<TaskController>().add(
                                        ToggleTask(
                                          task: state.tasks[index],
                                          isFinished: value ?? false,
                                        ),
                                      );
                                    },
                                  ),
                                  title: Text(
                                    state.tasks[index].taskName,
                                    style: state.tasks[index].isFinished
                                        ? theme.bodyMedium!.copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor: Color(0XFFA0A0A0),
                                            decorationThickness: 2,
                                            color: Color(0XFFA0A0A0),
                                          )
                                        : theme.bodyMedium,
                                  ),
                                  subtitle: state.tasks[index].isFinished
                                      ? null
                                      : Text(
                                          state.tasks[index].taskDescription,
                                          style: theme.labelMedium,
                                        ),
                                  trailing: Icon(
                                    Icons.more_vert_rounded,
                                    color: Color(0XFFC6C6C6),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      case ErrorState():
                        return Center(child: Text(state.message));
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TaskPage()),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(Icons.add),
                        ),
                        Text("Add new task", style: theme.displayMedium),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
