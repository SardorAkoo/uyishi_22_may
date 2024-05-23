import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi_22may/controllers/counter_controller.dart';
import 'package:uyishi_22may/views/screens/counter_screens.dart';
import 'package:uyishi_22may/views/widgets/counter_view.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskController(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Vazifa Boshqaruvchisi'),
          ),
          body: Column(
            children: [
              Expanded(child: TaskListView()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TaskReportView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
