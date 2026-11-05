import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/models/database_model.dart';

class DBhelper {
  static final String tablename = 'todo';
  static final String columnid = 'id';
  static final String columntitle = 'task_title';
  static final String columnDate = 'date';
  static final String columnPriority = 'priority';
  static final String columniscompleted = 'isCompleted';

  DBhelper._();

  static final DBhelper instance = DBhelper._();

  Database? db;
  //database open
  Future<Database?> getDB() async {
    if (db != null) {
      return db!;
    } else {
      return await openDB();
    }
  }

  Future<Database?> openDB() async {
    Directory directory = await getApplicationDocumentsDirectory();

    db = await openDatabase(
      join(directory.path, 'todo.db'),
      onCreate: (db, version) async {
        await db.execute('''

           CREATE TABLE $tablename(
                $columnid INTEGER PRIMARY KEY AUTOINCREMENT,
                $columntitle TEXT,
                $columnDate TEXT,
                $columnPriority TEXT,
                $columniscompleted INT  
           
           )

                   ''');
      },
      version: 1,
    );

    return db!;
  }

  //Insert todo in database table

  Future<void> insertToDo(DatabaseModel todoData) async {
    final mydb = await getDB();

    await mydb!.insert(
      tablename,
      todoData.toMap(),
      conflictAlgorithm: ConflictAlgorithm.abort,
    );
  }

  /// fetch data from selected date
  Future<List<DatabaseModel>> fetchData(DateTime date) async {
    final mydb = await getDB();

    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(Duration(days: 1));

    final result = await mydb!.query(
      tablename,
      where: "$columnDate>=? AND $columnDate< ?",
      whereArgs: [start.toIso8601String(), end.toIso8601String()],
      orderBy: "$columnDate ASC",
    );

    return result.map((e) => DatabaseModel.fromMap(e)).toList();
  }

  //Get total number of task in specific date and time

  Future<int> getTotalTasks(DateTime date) async {
    final mydb = await getDB();

    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(Duration(days: 1));

    final result = await mydb!.rawQuery(
      '''

SELECT COUNT(*) AS total
FROM $tablename
WHERE $columnDate>= ? AND $columnDate< ?
''',
      [start.toIso8601String(), end.toIso8601String()],
    );

    return (result.first['total'] as int?) ?? 0;
  }

  //update database table

  Future<void> updateRow(int id, bool isCompleted) async {
    final mydb = await getDB();

    await mydb!.update(
      tablename,
      {columniscompleted: isCompleted ? 1 : 0},
      where: '$columnid= ?',
      whereArgs: [id],
    );
  }
}
