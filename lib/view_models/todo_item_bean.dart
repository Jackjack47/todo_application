class TodoItemBean {
  TodoItemBean({
    required this.name,
    required this.createDate,
    required this.isAchieved,
    required this.checked,
  });

  String name;

  DateTime createDate;

  bool isAchieved;

  bool checked;

  TodoItemBean copyWith({
    String? name,
    DateTime? createDate,
    bool? isAchieved,
    bool? checked,
  }) {
    return TodoItemBean(
      name: name ?? this.name,
      createDate: createDate ?? this.createDate,
      isAchieved: isAchieved ?? this.isAchieved,
      checked: checked ?? this.checked,
    );
  }

  @override
  String toString() {
    return 'TodoItemBean{name: $name, createDate: $createDate, isAchieved: $isAchieved, checked: $checked}';
  }
}
