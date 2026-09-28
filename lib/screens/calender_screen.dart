import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widgets/segment_title.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class CalenderScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Calendar',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'View your Task by Date',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
            ),
            SizedBox(height: 15),
            CalendarWidget(
              selectedDate: selectedDate,
              onDateChange: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            SizedBox(height: 15),
            SegmentTitle(
              title: DateFormat('EEE, MMM dd').format(selectedDate),
              subtitle: '3 Task',
            ),
            SizedBox(height: 10),
            TodoTile(
              task: 'Finish Project Work',
              date: DateFormat('EEE, MMM dd').format(selectedDate),
              priority: 'Medium',
              isComplted: false,
            ),
            TodoTile(
              task: 'Finish Project Work',
              date: DateFormat('EEE, MMM dd').format(selectedDate),
              priority: 'Medium',
              isComplted: false,
            ),
            TodoTile(
              task: 'Finish Project Work',
              date: DateFormat('EEE, MMM dd').format(selectedDate),
              priority: 'High',
              isComplted: false,
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarWidget extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChange;
  const new({
    super.key,
    required this.selectedDate,
    required this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black.withAlpha(30)),
        borderRadius: BorderRadius.circular(10),
        color: Colors.red.withAlpha(10),
      ),
      child: CalendarDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2027),
        onDateChanged: onDateChange,
      ),
    );
  }
}
