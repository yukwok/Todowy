import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todowy/screens/tasks_screen.dart';

import 'models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
          providers: [
            ChangeNotifierProvider<TaskData>(create: (context) => TaskData()),
          ],
          child: MaterialApp(
            home: TasksScreen(),
          ),

      );



  }
}

//MultiProvider(
//providers: [
//Provider<Something>(create: (_) => Something()),
//Provider<SomethingElse>(create: (_) => SomethingElse()),
//Provider<AnotherThing>(create: (_) => AnotherThing()),
//],
//child: someWidget,
//)


