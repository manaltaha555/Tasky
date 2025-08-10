import 'package:flutter/material.dart';
import 'package:todoapp/view/pages/task_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0XFF15B86C),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => TaskPage()));
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "No Tasks Yet, Try To Add New One.",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
