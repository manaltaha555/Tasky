import 'package:flutter/material.dart';
import 'package:todoapp/view/components/custom_text_form_field.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Task", style: TextStyle(fontFamily: "Poppins"),)),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
        child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Text(
                      " Add Task",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ],
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                controller: taskName,
                text: "Task Name",
                hintText: "Finish UI design for login screen",
              ),
            ),
            CustomTextFormField(
              controller: taskDescription,
              text: "Task Description",
              maxLine: 4,
              hintText: "Finish onboarding UI and hand off to devs by Thursday",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "High Priority",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Switch(
                  value: isActive,
                  activeColor: Color(0XFF15B86C),
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    setState(() {
                      isActive = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
