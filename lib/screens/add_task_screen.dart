import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todowy/models/task.dart';
import 'package:todowy/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskName;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        height: 200.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add task here',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            TextField(
              onChanged: (value) {
                //print(value);
                newTaskName = value;
              },
              style: TextStyle(
                fontSize: 20.0,
              ),
              autofocus: true,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
            ),
            FlatButton(
              color: Colors.amberAccent,
              onPressed: () {
                if (newTaskName != null)
                  Provider.of<TaskData>(context).addTask(newTaskName);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
