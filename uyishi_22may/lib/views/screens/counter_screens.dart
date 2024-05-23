import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_22may/controllers/counter_controller.dart';


class TaskListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TaskController>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Vazifalar Ro\'yxati'),
      ),
      body: ListView.builder(
        itemCount: taskController.tasks.length,
        itemBuilder: (context, index) {
          final task = taskController.tasks[index];
          return ListTile(
            title: Text(task.title),
            trailing: IconButton(
              icon: Icon(
                task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              ),
              onPressed: () {
                taskController.toggleTaskStatus(index);
              },
            ),
            onLongPress: () {
              taskController.deleteTask(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final titleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Vazifa qo\'shish'),
          content: TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Sarlavha'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Bekor qilish'),
            ),
            TextButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  Provider.of<TaskController>(context, listen: false).addTask(
                    titleController.text,
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Text('Qo\'shish'),
            ),
          ],
        );
      },
    );
  }
}
