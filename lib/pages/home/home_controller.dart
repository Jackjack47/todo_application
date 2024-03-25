import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/bean/todo_item_bean.dart';
import '../../view_models/bean/landmark_item_bean.dart';
import '../todo_detail/todo_detail_page.dart';
import '../widgets/delete_todo_alert_dialog.dart';
import '../widgets/new_todo_dialog.dart';

class HomeController extends GetxController {
  RxList<TodoItemBean> todoItemList = RxList([
    TodoItemBean(
      todo: "todo",
      landmarks: [LandmarkItemBean(landmark: "Created", createDate: DateTime.now())],
      isAchieved: false,
      checked: false,
    ),
    TodoItemBean(
      todo: "todo1",
      landmarks: [LandmarkItemBean(landmark: "Created", createDate: DateTime.now())],
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

  void onListItemTap(BuildContext context, int index) {
    if (isEditMode.value) {
      final item = todoItemList[index];
      todoItemList[index] = item.copyWith(checked: !item.checked);
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => TodoDetailPage(item: todoItemList[index])));
    }
  }

  onAddButtonTap(BuildContext context) async {
    final result = await showDialog<TodoItemBean>(context: context, builder: (context) => const NewTodoDialog());
    if (result != null) {
      todoItemList.add(result);
    }
  }

  void onDeleteFabTap(BuildContext context) async {
    final result = await showDialog<bool>(context: context, builder: (_) => const DeleteTodoAlertDialog());
    if (result != null && result) {
      todoItemList.value = todoItemList.where((e) => !e.checked).toList();
      _exitEditMode();
    }
  }
}
