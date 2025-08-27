import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/bloc/task_controller.dart';
import 'package:todoapp/bloc/task_event.dart';
import 'package:todoapp/view/components/custom_text_form_field.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final TextEditingController taskName = TextEditingController();
  final TextEditingController taskDescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("New Task")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          controller: taskName,
                          text: "Task Name",
                          hintText: "Finish UI design for login screen",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Can't Save task without name";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      CustomTextFormField(
                        controller: taskDescription,
                        text: "Task Description",
                        maxLine: 4,
                        hintText:
                            "Finish onboarding UI and hand off to devs by Thursday",
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can't Save task without description";
                          } else {
                            return null;
                          }
                        },
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
                            activeThumbColor: Color(0XFF15B86C),
                            onChanged: (bool value) {
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 16,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<TaskController>().add(
                        AddTask(
                          taskName: taskName.text,
                          taskDescription: taskDescription.text,
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
