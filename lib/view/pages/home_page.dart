import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/services/preferneces.dart';
import 'package:todoapp/view/components/task_card.dart';
import 'package:todoapp/view/pages/task_page.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String? username = Preferneces().getString("userName") ?? "username";

  @override
  void initState() {
    super.initState();
    context.read<TaskController>().add(LoadTasks(tasks: []));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            "assets/images/manal.jpg",
                          ),
                          radius: 42,
                        ),
                        title: Text(
                          "Good Evening $username",
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
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: BlocBuilder<TaskController, TaskState>(
                  builder: (context, state) {
                    switch (state) {
                      case IsLoadingState():
                        return Center(
                          child: CircularProgressIndicator(color: Colors.white),
                        );
                      case IsLoadedState():
                        final highPriority = state.tasks
                            .where((t) => t.isPriority)
                            .toList();
                        final normalTasks = state.tasks
                            .where((t) => !t.isPriority)
                            .toList();
                        int allTasks = state.tasks.length;
                        int finishedTasks = state.tasks
                            .where((t) => t.isFinished)
                            .toList()
                            .length;
                        double precentage = (finishedTasks / allTasks) * 100;
                        if (state.tasks.isEmpty) {
                          return Center(
                            child: Text(
                              "No Tasks Yet, Try Adding One!",
                              style: theme.bodyMedium,
                            ),
                          );
                        } else {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                color: Color(0XFF2A2A2A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(
                                    "Achieved Tasks",
                                    style: theme.bodyMedium,
                                  ),
                                  subtitle: Text(
                                    "$finishedTasks of $allTasks",
                                    style: theme.labelMedium,
                                  ),
                                  trailing: CircularPercentIndicator(
                                    radius: 27,
                                    lineWidth: 5.0,
                                    percent: precentage / 100,
                                    center: Text(
                                      "${precentage.floor()} %",
                                      style: theme.bodyMedium,
                                    ),
                                    progressColor: Color(0XFF15B86C),
                                    backgroundColor: Color(0XFF9E9E9E),
                                  ),
                                ),
                              ),
                              Card(
                                margin: EdgeInsets.symmetric(vertical: 8),
                                color: Color(0XFF2A2A2A),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    20,
                                  ),
                                ),
                                child:Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8 ),
                                        child: Text(
                                          "High priority tasks",
                                          style: theme.bodyMedium!.copyWith(
                                            color: Color(0XFF15B86C),
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: highPriority.length,
                                        itemBuilder: (context, index) {
                                          return TaskCard(
                                            task: highPriority[index],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              if (normalTasks.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  child: Text(
                                    "My Tasks",
                                    style: theme.headlineSmall?.copyWith(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: normalTasks.length,
                                itemBuilder: (context, index) {
                                  return Card(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    color: Color(0XFF2A2A2A),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(20),
                                    ),
                                    child: TaskCard(
                                      task: normalTasks[index],
                                    ),
                                  );
                                },
                              ),
                            ],
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
