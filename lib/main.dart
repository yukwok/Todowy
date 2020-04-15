import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todowy/models/dummy_data.dart';

import 'package:todowy/screens/tasks_screen.dart';

import 'models/task_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskData>(
          create: (BuildContext context) => TaskData(),
        ),
        //TODO: Practice and test the concept of Provider
        ChangeNotifierProvider<DummyData>(
          create: (context) => DummyData(),
        ),
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
