import 'package:flutter/material.dart';
import 'package:todo_app/core/priority.dart';

class TodoTile extends StatelessWidget {
  //this one will change to todo object after data model is created...
  final String task;
  final String date;
  final String priority;
  final bool isComplted;
  final VoidCallback? ontap;
  const new({
    super.key,
    required this.task,
    required this.date,
    required this.priority,
    required this.isComplted,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black.withAlpha(50)),
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
        leading: InkWell(
          onTap: ontap,
          child: Icon(isComplted ? Icons.check_circle : Icons.circle_outlined),
        ),
        title: Text(
          task,
          style: TextStyle(
            decoration: isComplted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        subtitle: Text(date),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                ),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                ),
                backgroundColor: WidgetStateProperty.all(
                  Priority.prioritiesColor[priority]!.withValues(alpha: 0.15),
                ),
              ),
              onPressed: () {},
              child: Text(
                priority,
                style: TextStyle(
                  color: Priority.prioritiesColor[priority],
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.more_vert),
          ],
        ),
      ),
    );
  }
}
