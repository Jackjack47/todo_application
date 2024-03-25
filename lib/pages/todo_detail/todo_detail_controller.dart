import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/bean/todo_item_bean.dart';
import '../widgets/new_landmark_dialog.dart';

class TodoDetailController extends GetxController {
  TodoDetailController(TodoItemBean item) : item = Rx(item);

  Rx<TodoItemBean> item;

  void addLandmarkTileTap(BuildContext context) async {
    final result = await showDialog(context: context, builder: (_) => const NewLandmarkDialog());
    if (result != null) {
      final landmarks = item.value.landmarks;
      landmarks.insert(0, result);
      item.value = item.value.copyWith(landmarks: landmarks);
    }
  }
}
