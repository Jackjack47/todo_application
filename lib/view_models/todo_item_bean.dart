import './landmark_bean.dart';

class TodoItemBean {
  TodoItemBean({
    this.id,
    required this.todo,
    required this.landmarks,
    required this.isAchieved,
    required this.checked,
  });

  final int? id;

  final String todo;

  final List<LandmarkBean> landmarks;

  final bool isAchieved;

  final bool checked;

  TodoItemBean copyWith({
    int? id,
    String? todo,
    List<LandmarkBean>? landmarks,
    bool? isAchieved,
    bool? checked,
  }) {
    return TodoItemBean(
      id: id ?? this.id,
      landmarks: landmarks ?? this.landmarks,
      todo: todo ?? this.todo,
      isAchieved: isAchieved ?? this.isAchieved,
      checked: checked ?? this.checked,
    );
  }
}
