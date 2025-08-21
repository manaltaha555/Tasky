import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/controller/task_controller.dart';
import 'package:todoapp/view/pages/task_page.dart';

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
                child: Consumer<TaskController>(
                  builder: (context, controller, child) {
                    return ListView.builder(
                      itemCount: controller.getTasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          color: Color(0XFF2A2A2A),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(20),
                          ),
                          child: ListTile(
                            leading: Checkbox(
                              value: controller.getTasks[index].isFinished,
                              activeColor: Color(0XFF15B86C),
                              onChanged: (value) {
                                controller.changeTask(
                                  controller.getTasks[index],
                                  value,
                                );
                              },
                            ),
                            title: Text(
                              controller.getTasks[index].taskName,
                              style: controller.getTasks[index].isFinished
                                  ? theme.bodyMedium!.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor:Color(0XFFA0A0A0) ,
                                      decorationThickness: 2,
                                      color: Color(0XFFA0A0A0),
                                    )
                                  : theme.bodyMedium,
                            ),
                            subtitle: controller.getTasks[index].isFinished
                                ? null
                                : Text(
                                    controller.getTasks[index].taskDescription,
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
                        Text("Add new task"),
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
