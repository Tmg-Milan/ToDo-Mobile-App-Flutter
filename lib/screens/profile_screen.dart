import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final List<TaskMenuItem> taskList = [
    TaskMenuItem(
      iconData: Icons.task_outlined,
      title: 'My Tasks',
      ontab: () {},
      subtitle: 'View all your tasks',
    ),
    TaskMenuItem(
      iconData: Icons.settings_outlined,
      title: 'Settings',
      ontab: () {},
      subtitle: 'App preferences',
    ),
    TaskMenuItem(
      iconData: Icons.notifications_outlined,
      title: 'Notifications',
      ontab: () {},
      subtitle: 'Manage Notifications',
    ),
    TaskMenuItem(
      iconData: Icons.question_mark_rounded,
      title: 'Help & Support',
      ontab: () {},
      subtitle: 'Get help or send Feedback',
    ),
    TaskMenuItem(
      iconData: Icons.info_outline,
      title: 'About',
      ontab: () {},
      subtitle: 'App version 1.0',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 250, 253),
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 15),
        backgroundColor: Colors.transparent,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Milan Tamang',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'milantmg452@gmail.com',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit_outlined)),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 70,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TaskStateItems(taskCount: '12', title: 'Total Tasks'),
                  VerticalDivider(
                    color: Colors.black.withAlpha(60),
                    thickness: 1,
                  ),
                  TaskStateItems(taskCount: '8', title: 'Completed'),
                  VerticalDivider(
                    color: Colors.black.withAlpha(60),
                    thickness: 1,
                  ),
                  TaskStateItems(taskCount: '4', title: 'Pending'),
                ],
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, _) => SizedBox(height: 10),
                itemCount: taskList.length,
                itemBuilder: ((context, index) {
                  final task = taskList[index];
                  return ReusableTask(
                    iconData: task.iconData,
                    title: task.title,
                    ontab: task.ontab,
                    subtitle: task.subtitle,
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskStateItems extends StatelessWidget {
  final String taskCount;
  final String title;
  const new({super.key, required this.taskCount, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          taskCount,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}

//Taskmenuitem Data model

class TaskMenuItem {
  final IconData iconData;
  final String title;
  final String subtitle;
  final VoidCallback ontab;

  const TaskMenuItem({
    required this.iconData,
    required this.title,
    required this.ontab,
    required this.subtitle,
  });
}

/// Reusable task settings
class ReusableTask extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtitle;
  final VoidCallback ontab;

  const ReusableTask({
    super.key,
    required this.iconData,
    required this.title,
    required this.ontab,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      leading: Icon(iconData, size: 30),
      title: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios, size: 15),
    );
  }
}
