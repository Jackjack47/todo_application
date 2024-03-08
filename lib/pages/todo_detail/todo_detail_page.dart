import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_models/todo_item_bean.dart';
import 'todo_detail_controller.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({super.key, this.todoItemBean});

  final TodoItemBean? todoItemBean;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: TodoDetailController(todoItemBean),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_.isEditMode ? AppLocalizations.of(context)!.edit : AppLocalizations.of(context)!.newTodo),
            actions: [
              TextButton(onPressed: () => _.onConfirm(context), child: Text(AppLocalizations.of(context)!.confirm)),
            ],
          ),
          body: Center(
            child: Text(_.item.value.toString()),
          ),
        );
      },
    );
  }
}
