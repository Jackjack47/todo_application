import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_application/pages/todo_detail/todo_detail_page.dart';

import '../../view_models/todo_item_bean.dart';
import 'home_controller.dart';
import 'home_todo_list_item.dart';

class HomeTodoList extends StatelessWidget {
  const HomeTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Obx(() {
        final data = _.todoItemList;
        final isEditMode = _.isEditMode.value;
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          prototypeItem: HomeTodoListItem(
            item: TodoItemBean(name: '', createDate: DateTime(2000), isAchieved: false, checked: false),
            isEditMode: false,
          ),
          itemBuilder: (context, index) {
            final item = data[index];
            return HomeTodoListItem(
              item: item,
              isEditMode: isEditMode,
              onTap: () {
                if (isEditMode) {
                  _.select(index);
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TodoDetailPage(todoItemBean: item),
                  ));
                }
              },
            );
          },
          itemCount: data.length,
        );
      }),
    );
  }
}
