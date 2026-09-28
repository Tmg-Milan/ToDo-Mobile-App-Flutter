import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/segment_title.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Greetings(),
            SizedBox(height: 10),
            TaskCard(),
            SizedBox(height: 20),
            SegmentTitle(title: 'Today', subtitle: '3 tasks'),
            SizedBox(height: 10),
            TodoTile(
              task: 'Finish project report',
              date: 'Today',
              priority: 'High',
              isComplted: isCompleted,
              ontap: () {
                setState(() {
                  isCompleted = !isCompleted;
                });
              },
            ),
            TodoTile(
              task: 'Go to the Gym',
              date: 'Today',
              priority: 'Medium',
              isComplted: isCompleted,
            ),
            TodoTile(
              task: 'Buy Groceries',
              date: 'Today',
              priority: 'Low',
              isComplted: isCompleted,
            ),
            SegmentTitle(title: 'Upcoming', subtitle: '3 tasks'),
          ],
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
            Text('Good morning'),
            Spacer(),
            InkWell(child: Icon(Icons.notifications_outlined)),
          ],
        ),
        Text(
          'Milan',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
      trailing: Icon(Icons.arrow_forward_ios, size: 20),
    );
  }
}
