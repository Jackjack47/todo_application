import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/todo_item_bean.dart';
import '../todo_detail/todo_detail_page.dart';

class HomeController extends GetxController {
  RxList<TodoItemBean> todoItemList = RxList([]);
  RxBool isEditMode = RxBool(false);

  bool _allChecked = false;
  bool _allUnchecked = true;
  late StreamSubscription? _todoItemListSubscription;

  @override
  void onClose() {
    _todoItemListSubscription?.cancel();
    _todoItemListSubscription = null;
    super.onClose();
  }

  void onTodoItemListUpdate(List<TodoItemBean> data) {
    var checked = true;
    var unchecked = true;
    for (var i = 0; i < data.length; ++i) {
      var o = data[i];
      checked = checked & o.checked;
      unchecked = unchecked & !o.checked;
    }
    _allChecked = checked;
    _allUnchecked = unchecked;
  }

  void edit() {
    if (isEditMode.value) {
      exitEditMode();
    } else {
      startEditMode();
    }
  }

  void startEditMode() {
    isEditMode.value = true;
    _todoItemListSubscription = todoItemList.listen(onTodoItemListUpdate);
  }

  void exitEditMode() {
    isEditMode.value = false;
    _todoItemListSubscription?.cancel();
    _todoItemListSubscription = null;
    if (!_allUnchecked && todoItemList.isNotEmpty) {
      todoItemList.value = todoItemList.map((e) => e.copyWith(checked: false)).toList();
    }
    _allChecked = false;
    _allUnchecked = true;
  }

  void select(int index) {
    final item = todoItemList[index];
    todoItemList[index] = item.copyWith(checked: !item.checked);
  }

  void selectAll() {
    todoItemList.value = todoItemList.map((e) => e.copyWith(checked: !_allChecked)).toList();
  }

  void delete() {
    todoItemList.value = todoItemList.where((e) => !e.checked).toList();
    exitEditMode();
  }

  void add(BuildContext context) {
    Navigator.of(context)
        .push<TodoItemBean>(MaterialPageRoute(builder: (context) => const TodoDetailPage()))
        .then((data) {
      if (data != null) {
        todoItemList.add(data);
      }
    });
  }
}
