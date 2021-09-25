import 'dart:collection';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:daily_notes/constant.dart';
import 'package:daily_notes/models/task.dart';
import 'package:flutter/Material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskCount {
    return _tasks.length;
  }

  void addTask(String? newTaskTitle, String newSubTitle, String date) {
    final task = Task(name: newTaskTitle, subname: newSubTitle, date: date);
    _tasks.add(task);

    notifyListeners();
  }

  void upDateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  String formattedDate = DateFormat('dd/MM/yyyy  kk:mm').format(DateTime.now());

  void alertMethod(BuildContext context, Task task) {
    Alert(
      context: context,
      type: AlertType.none,
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      image: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      title: "Alert",
      style: AlertStyle(
        alertElevation: 0.0,
        titleStyle: GoogleFonts.mcLaren(textStyle: kAlertTitleStyle),
        descStyle: GoogleFonts.mcLaren(
          textStyle: kAlertDescStyle,
        ),
      ),
      desc: "Are you sure want to delete the Task.",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: GoogleFonts.mcLaren(
              textStyle: kAlertButtonstyle,
            ),
          ),
          onPressed: () {
            _tasks.remove(task);

            Navigator.pop(context);
            notifyListeners();
          },
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "No",
            style: GoogleFonts.mcLaren(
              textStyle: kAlertButtonstyle,
            ),
          ),
          onPressed: () => Navigator.pop(context),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(116, 116, 191, 1.0),
              Color.fromRGBO(52, 138, 199, 1.0)
            ],
          ),
        )
      ],
    ).show();
  }

  void dialogInfo(BuildContext context, Task task) {
    AwesomeDialog(
      context: context,
      headerAnimationLoop: false,
      dialogType: DialogType.NO_HEADER,
      title: task.name,
      customHeader: Image.asset(
        'assets/logo.png',
        height: 78,
        width: 80,
        fit: BoxFit.cover,
      ),
      desc: task.subname,
      btnOkOnPress: () {
        debugPrint('OnClcik');
      },
      btnOkColor: Colors.lightBlueAccent,
      btnOkIcon: Icons.check_circle,
    )..show();
  }
}
