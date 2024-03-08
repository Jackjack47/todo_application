import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_application/view_models/todo_item_bean.dart';

class TodoDetailController extends GetxController {
  TodoDetailController(TodoItemBean? item) {
    isEditMode = item != null;
    this.item = Rx(item ?? TodoItemBean(name: 'Todo', createDate: DateTime.now(), isAchieved: false, checked: false));
  }

  bool isEditMode = false;
  late Rx<TodoItemBean> item;

  onConfirm(BuildContext context) {
    Navigator.of(context).pop(item.value);
  }
}
