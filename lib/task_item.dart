// ignore_for_file: empty_constructor_bodies

class TaskItem {
  String taskName;
  String deadline;
  String description;
  bool checked = false;

  TaskItem(
      {required this.taskName,
      required this.deadline,
      required this.description,
      required this.checked});
}
