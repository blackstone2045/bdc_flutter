import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  final List taskList = [
    {"taskTitle": "Study at morning", "status": false},
    {"taskTitle": "H.W complete within before noon", "status": false},
    {
      "taskTitle": "Review and organize weekly code repository backups",
      "status": false,
    },
    {
      "taskTitle": "Review and organize weekly code repository backups",
      "status": false,
    },
  ];
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return task(index);
        },
      ),
    );
  }

  Widget task(int index) {
    final task = taskList[index];
    final bool isCompleted = task["status"];
    return Container(
      margin: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.green.shade100 : Colors.red.shade100,
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListTile(
        leading: Checkbox(
          value: isCompleted,
          onChanged: (status) {
            setState(() {
              task["status"] = status ?? false;
            });
          },
        ),
        title: Text(
          task["taskTitle"] ?? "Untitled Task",
          style: TextStyle(
            decoration: isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            color: isCompleted ? Colors.grey : Colors.black,
            fontWeight: isCompleted ? FontWeight.normal : FontWeight.bold,
          ),
        ),
        subtitle: Text(" ${DateTime.now()}"),
      ),
    );
  }
}
