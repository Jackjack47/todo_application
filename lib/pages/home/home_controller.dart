import 'package:get/get.dart';

import '../../models/todo_item.dart';

class HomeController extends GetxController {
  RxList<TodoItem> todoItemList = RxList([]);
  RxBool isEditMode = RxBool(false);

  edit() {
    isEditMode.value = !isEditMode.value;
  }

  addTodo() {
    todoItemList.add(TodoItem(
      name: 'aaaa',
      createDate: DateTime.now(),
      isAchieved: false,
    ));
  }
}
