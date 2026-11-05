import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/db_helper.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/widgets/segment_title.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCompleted = false;

  DBhelper dBhelper = DBhelper.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TodoProvider>().taskByDate(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 250, 253),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Greetings(),
              SizedBox(height: 10),
              TaskCard(),
              SizedBox(height: 20),
              SegmentTitle(title: 'Today', subtitle: ' tasks'),
              SizedBox(height: 10),
              Consumer<TodoProvider>(
                builder: (context, todoProvider, child) {
                  return Column(
                    children: todoProvider.tasks.map((task) {
                      return TodoTile(
                        task: task.task,
                        date: DateFormat("dd MMM").format(task.date),
                        priority: task.priority,
                        isComplted: task.isCompleted,
                        ontap: () {
                          if (task.id != null) {
                            todoProvider.updateRow(task.id!, !task.isCompleted);
                          }
                          todoProvider.taskByDate(DateTime.now());
                        },
                      );
                    }).toList(),
                  );
                },
              ),
              SizedBox(height: 15),
              SegmentTitle(title: "Previous", subtitle: '3 tasks'),
            ],
          ),
        ),
      ),
    );
  }
}

//User Greeetings
class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateTime.now();
    final formattedDate = DateFormat('EEE, dd MMM yyyy ').format(date);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Good morning,', style: TextStyle(fontSize: 18)),
            Spacer(),
            InkWell(child: Icon(Icons.notifications_outlined, size: 30)),
          ],
        ),
        Text(
          'Milan',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Text(formattedDate),
      ],
    );
  }
}

//task card to show total of today's task

class TaskCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      tileColor: const Color.fromARGB(255, 237, 238, 238),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Icon(Icons.task, color: Colors.white, size: 25),
      ),
      title: Text("Today's Tasks"),
      subtitle: Text('3 Tasks'),
      trailing: Icon(Icons.arrow_forward_ios, size: 15),
    );
  }
}
