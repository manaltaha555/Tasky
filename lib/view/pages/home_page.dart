import 'package:flutter/material.dart';
import 'package:todoapp/view/pages/task_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) =>  TaskPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(children: []),
    );
  }
}
