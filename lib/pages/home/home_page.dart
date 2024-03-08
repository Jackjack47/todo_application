import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_controller.dart';
import 'home_todo_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.todo),
            actions: [
              Obx(() {
                final isEditMode = _.isEditMode.value;
                return isEditMode
                    ? TextButton(onPressed: _.selectAll, child: Text(AppLocalizations.of(context)!.selectAll))
                    : const SizedBox();
              }),
              Obx(() {
                final isEditMode = _.isEditMode.value;
                return isEditMode
                    ? TextButton(onPressed: _.edit, child: Text(AppLocalizations.of(context)!.cancel))
                    : Obx(() {
                        final data = _.todoItemList;
                        return IconButton(onPressed: data.isEmpty ? null : _.edit, icon: const Icon(Icons.delete));
                      });
              }),
            ],
          ),
          body: const HomeTodoList(),
          floatingActionButton: Obx(() {
            final isEditMode = _.isEditMode.value;
            return FloatingActionButton(
              onPressed: () => isEditMode ? _.delete : _.add(context),
              child: isEditMode ? const Icon(Icons.delete) : const Icon(Icons.add),
            );
          }),
        );
      },
    );
  }
}
