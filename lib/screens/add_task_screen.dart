import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  DateTime selectedDate = DateTime.now();
  String selected = 'High';
  List<String> priorities = ['High', 'Medium', 'Low'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add new Task',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Task Title *'),
            SizedBox(height: 10),
            TextInputField(),
            SizedBox(height: 20),

            Text('Date'),
            SizedBox(height: 10),
            DatePicker(
              selectedDate: selectedDate,
              onDateChanged: (date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Priority'),
            SizedBox(height: 10),
            PriorityCard(
              selected: selected,
              prioties: priorities,
              onValueChanged: (value) {
                setState(() {
                  selected = value;
                });
              },
            ),
            SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blue),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Title input field
class TextInputField extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(5),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: 'What do you need to do?',
        prefixIcon: Icon(Icons.menu),
      ),
    );
  }
}

///This is Date picker Tile
class DatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  const new({
    super.key,
    required this.selectedDate,
    required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    final date = DateFormat('EEE, MMM dd').format(selectedDate);
    return ListTile(
      minTileHeight: 48,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 0.7),
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(Icons.calendar_today),
      title: Text(date),
      trailing: IconButton(
        onPressed: () async {
          final DateTime? datetime = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2700),
          );
          if (datetime != null) {
            onDateChanged(datetime);
          }
        },
        icon: Icon(Icons.arrow_drop_down),
      ),
    );
  }
}

///Choose the priority of task
class PriorityCard extends StatelessWidget {
  final String selected;
  final List<String> prioties;
  final ValueChanged<String> onValueChanged;
  const new({
    super.key,
    required this.selected,
    required this.prioties,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      children: prioties.map((priority) {
        final bool isSelected = selected == priority;

        return GestureDetector(
          onTap: () {
            onValueChanged(priority);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: isSelected ? Colors.red : Colors.white,
              border: Border.all(
                color: isSelected ? Colors.transparent : Colors.black,
              ),
            ),
            child: Text(priority),
          ),
        );
      }).toList(),
    );
  }
}
