import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_models/landmark_bean.dart';
import '../../view_models/todo_item_bean.dart';
import 'home_controller.dart';
import 'home_todo_list_item_view.dart';

class HomeTodoListView extends StatelessWidget {
  const HomeTodoListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Obx(() {
        final data = _.todoItemList;
        final isEditMode = _.isEditMode.value;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          prototypeItem: HomeTodoListItemView(
            item: TodoItemBean(
              todo: "todo",
              landmarks: [LandmarkBean(landmark: "created", createDate: DateTime.now())],
              isAchieved: false,
              checked: false,
            ),
            isEditMode: isEditMode,
          ),
          itemBuilder: (context, index) {
            final item = data[index];
            return HomeTodoListItemView(
              item: item,
              isEditMode: isEditMode,
              onTap: () => _.onListItemTap(index),
            );
          },
          itemCount: data.length,
        );
      }),
    );
  }
}
