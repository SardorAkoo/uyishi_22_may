import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_22may/controllers/counter_controller.dart';

class TaskReportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskController = Provider.of<TaskController>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Bajarilgan vazifalar: ${taskController.completedTaskCount}'),
        Text('Bajarilmagan vazifalar: ${taskController.uncompletedTaskCount}'),
      ],
    );
  }
}
