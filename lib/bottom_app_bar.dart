import 'package:flutter/material.dart';
import 'package:todo_app/screens/calender_screen.dart';
import 'package:todo_app/screens/completed_task_screen.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const new({super.key});

  @override
  State<BottomBar> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomBar> {
  List<Widget> widgets = [
    HomeScreen(),
    CalenderScreen(),
    CompletedTaskScreen(),
    ProfileScreen(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.pushNamed(context, '/addnewtaskScreen');
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        // height: 110,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12, width: 0.3)),
        ),
        child: BottomAppBar(
          height: 60,
          padding: EdgeInsets.zero,
          color: Colors.white,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(
                icon: Icons.home_outlined,
                label: 'Home',
                selected: index == 0,
                onTap: () {
                  setState(() {
                    index = 0;
                  });
                },
              ),

              BottomNavItem(
                icon: Icons.calendar_month_outlined,
                label: 'Calendar',
                selected: index == 1,
                onTap: () {
                  setState(() {
                    index = 1;
                  });
                },
              ),
              const SizedBox(width: 50),
              BottomNavItem(
                icon: Icons.check_circle_outline,
                label: 'Completed',
                selected: index == 2,
                onTap: () {
                  setState(() {
                    index = 2;
                  });
                },
              ),

              // Space for FAB
              BottomNavItem(
                icon: Icons.person_outline,
                label: 'Profile',
                selected: index == 3,
                onTap: () {
                  setState(() {
                    index = 3;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 25, color: selected ? Colors.blue : Colors.grey),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: selected ? Colors.blue : Colors.grey,
                fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
