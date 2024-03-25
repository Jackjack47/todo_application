import 'landmark_item.dart';

class TodoItem {
  TodoItem({
    this.id,
    required this.todo,
    required this.landmarks,
    required this.isAchieved,
  });

  final int? id;

  final String todo;

  final List<LandmarkItem> landmarks;

  final bool isAchieved;

  TodoItem copyWith({
    int? id,
    String? todo,
    List<LandmarkItem>? landmarks,
    bool? isAchieved,
    bool? checked,
  }) {
    return TodoItem(
      id: id ?? this.id,
      landmarks: landmarks ?? this.landmarks,
      todo: todo ?? this.todo,
      isAchieved: isAchieved ?? this.isAchieved,
    );
  }
}
