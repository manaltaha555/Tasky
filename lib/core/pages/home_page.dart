import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/bloc/task_state.dart';
import 'package:todoapp/services/preferneces.dart';
import 'package:todoapp/core/components/task_card.dart';
import 'package:todoapp/core/pages/task_page.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String? username = Preferneces().getString("userName") ?? "username";
  var box = Hive.box('settings');

  @override
  void initState() {
    super.initState();
    context.read<TaskController>().add(LoadTasks(tasks: []));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isDark = box.get('isDark', defaultValue: false);
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
                          style: theme.textTheme.displayMedium,
                        ),
                        subtitle: Text(
                          "One task at a time.One step closer.",
                          style: theme.textTheme.labelMedium,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            // box.put('isDark',!isDark);
                            // setState(() {
                            // });
                          },
                          child: CircleAvatar(
                            backgroundColor: theme.cardColor,
                            child: SvgPicture.asset(
                              isDark
                                  ? "assets/icons/sun.svg"
                                  : "assets/icons/theme.svg",
                              color: theme.iconTheme.color,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Yuhuu ,Your work is ",
                      style: theme.textTheme.headlineLarge,
                    ),
                    Row(
                      children: [
                        Text(
                          "almost done!  ",
                          style: theme.textTheme.headlineLarge,
                        ),
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
                          child: CircularProgressIndicator(
                            color: theme.indicatorColor,
                          ),
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
                              style: theme.textTheme.bodyMedium,
                            ),
                          );
                        } else {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(highPriority.isNotEmpty)
                                Card(
                                  child: ListTile(
                                    title: Text(
                                      "Achieved Tasks",
                                      style: theme.textTheme.bodyMedium,
                                    ),
                                    subtitle: Text(
                                      "$finishedTasks of $allTasks",
                                      style: theme.textTheme.labelMedium,
                                    ),
                                    trailing: CircularPercentIndicator(
                                      radius: 27,
                                      lineWidth: 5.0,
                                      percent: precentage / 100,
                                      center: Text(
                                        "${precentage.floor()} %",
                                        style: theme.textTheme.bodyMedium,
                                      ),
                                      progressColor: Color(0XFF15B86C),
                                      backgroundColor: Color(0XFF9E9E9E),
                                    ),
                                  ),
                                ),
                                Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 16,
                                          top: 16,
                                          bottom: 8,
                                        ),
                                        child: Text(
                                          "High priority tasks",
                                          style: theme.textTheme.bodyMedium!
                                              .copyWith(
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
                                      style: theme.textTheme.headlineSmall
                                          ?.copyWith(fontSize: 20),
                                    ),
                                  ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: normalTasks.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      child: TaskCard(task: normalTasks[index]),
                                    );
                                  },
                                ),
                              ],
                            ),
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
                        Text(
                          "Add new task",
                          style: theme.textTheme.displayMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
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
