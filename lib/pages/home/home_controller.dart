import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/todo_item_bean.dart';
import '../../view_models/landmark_bean.dart';

class HomeController extends GetxController {
  RxList<TodoItemBean> todoItemList = RxList([
    TodoItemBean(
      todo: "todo",
      landmarks: [LandmarkBean(landmark: "created", createDate: DateTime.now())],
      isAchieved: false,
      checked: false,
    ),
    TodoItemBean(
      todo: "todo1",
      landmarks: [LandmarkBean(landmark: "created", createDate: DateTime.now())],
      isAchieved: true,
      checked: false,
    )
  ]);
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

  void _exitEditMode() {
    isEditMode.value = false;
    _todoItemListSubscription?.cancel();
    _todoItemListSubscription = null;
    if (!_allUnchecked && todoItemList.isNotEmpty) {
      for (var i = 0; i < todoItemList.length; ++i) {
        var o = todoItemList[i];
        if (o.checked) {
          todoItemList[i] = o.copyWith(checked: false);
        }
      }
    }
    _allChecked = false;
    _allUnchecked = true;
  }

  void onDeleteButtonTap() {
    isEditMode.value = true;
    _todoItemListSubscription = todoItemList.listen(onTodoItemListUpdate);
  }

  void onCancelButtonTap() {
    _exitEditMode();
  }

  void onSelectAllButtonTap() {
    todoItemList.value = todoItemList.map((e) => e.copyWith(checked: !_allChecked)).toList();
  }

  void onListItemTap(int index) {
    if (isEditMode.value) {
      final item = todoItemList[index];
      todoItemList[index] = item.copyWith(checked: !item.checked);
    }
  }

  void onFabTap(BuildContext context) {
    if (isEditMode.value) {
      todoItemList.value = todoItemList.where((e) => !e.checked).toList();
      _exitEditMode();
    }
  }
}
