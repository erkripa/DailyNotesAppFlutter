import 'package:daily_notes/models/task_data.dart';
import 'package:daily_notes/screens/addnewTask.dart';
import 'package:daily_notes/widgets/task_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddNewTask((newTaskTitle) {
                    // setState(() {
                    //   tasks.add(Task(name: newTaskTitle));
                    // });
                    Navigator.pop(context);
                  }),
                ),
              ),
            );
          }),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 30.0, bottom: 30.0, right: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Daily Notes",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 50.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskCount} Tasks",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TaskLists(),
            ),
          ),
        ],
      ),
    );
  }
}
