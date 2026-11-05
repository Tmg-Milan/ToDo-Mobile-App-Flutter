class DatabaseModel {
  int? id;
  String task;
  String priority;
  DateTime date;
  bool isCompleted;

  DatabaseModel({
    this.id,
    required this.task,
    required this.priority,
    required this.date,
    required this.isCompleted,
  });

  Map<String, dynamic> toMap() {
    return {
      'task_title': task,
      'priority': priority,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory DatabaseModel.fromMap(Map<String, dynamic> map) {
    return DatabaseModel(
      id: map['id'] as int?,
      task: map['task_title'] as String,
      priority: map['priority'] as String,
      date: DateTime.parse(map['date'] as String),
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
