import 'package:flutter/material.dart';
import 'package:todo_app/widgets/segment_title.dart';
import 'package:todo_app/widgets/todo_tile.dart';

class CompletedTaskScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  final List<String> filters = ['All', 'Today', 'Last 7 Days', '1 Month'];
  String selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Completed',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('You did Great!'),
              trailing: Icon(Icons.done, size: 50),
            ),
            SizedBox(height: 15),
            FilterCard(
              filters: filters,
              selectedFilter: selectedFilter,
              onChanged: (value) {
                setState(() {
                  selectedFilter = value;
                });
              },
            ),
            SizedBox(height: 30),
            SegmentTitle(title: 'Today', subtitle: '3 tasks'),
            SizedBox(height: 10),
            TodoTile(
              task: 'Read a book',
              date: 'Today',
              priority: 'Low',
              isComplted: true,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterCard extends StatelessWidget {
  final List<String> filters;
  final String selectedFilter;
  final ValueChanged<String> onChanged;
  const new({
    super.key,
    required this.filters,
    required this.selectedFilter,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 30,
      children: filters.map((filter) {
        bool isSelected = filter == selectedFilter;
        return GestureDetector(
          onTap: () {
            onChanged(filter);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              color: isSelected ? Colors.blue : Colors.white,
              border: Border.all(color: Colors.black.withAlpha(40)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(filter),
          ),
        );
      }).toList(),
    );
  }
}
