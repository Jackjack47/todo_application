class TodoItem {
  TodoItem({
    required this.name,
    required this.createDate,
    required this.isAchieved,
  });

  final String name;

  final DateTime createDate;

  final bool isAchieved;
}
