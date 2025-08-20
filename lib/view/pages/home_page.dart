import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/controller/task_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userName});

  final String userName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
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
              Consumer<TaskController>(
                builder: (context, controller, child) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(),
                        color: Color(0XFF2A2A2A),
                        child: ListTile(
                          trailing: Checkbox(value: controller.getTasks[index].isFinished, onChanged: TaskController.changeTask(controller.getTasks[index]) ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
