import 'package:flutter/material.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/models/database_model.dart';

class TodoProvider extends ChangeNotifier {
  DBhelper dBhelper = DBhelper.instance;
  //This stores tasks of one day not all task of database
  List<DatabaseModel> tasks = [];

  int get totaltask => tasks.length;

  //fetch task of specific date
  Future<void> taskByDate(DateTime date) async {
    tasks = await dBhelper.fetchData(date);
    notifyListeners();
  }

  ///add task in database
  Future<void> addTask(DatabaseModel data) async {
    await dBhelper.insertToDo(data);
    notifyListeners();
  }

  //update task wheather it's completed or not

  Future<void> updateRow(int id, bool isCompleted) async {
    await dBhelper.updateRow(id, isCompleted);
    notifyListeners();
  }
}
