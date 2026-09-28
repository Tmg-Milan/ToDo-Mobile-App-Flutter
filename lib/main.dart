import 'package:flutter/material.dart';
import 'package:todo_app/bottom_app_bar.dart';
import 'package:todo_app/screens/add_task_screen.dart';

import 'package:todo_app/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        '/bottombar': (context) => BottomBar(),
        '/addnewtaskScreen': (context) => AddTaskScreen(),
      },
    ),
  );
}
