import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_controller.dart';
import 'home_todo_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).todo),
            actions: [
              Obx(() => Offstage(
                    offstage: !_.isEditMode.value,
                    child: TextButton(
                        onPressed: _.onSelectAllButtonTap, child: Text(AppLocalizations.of(context).selectAll)),
                  )),
              Obx(() => Offstage(
                    offstage: !_.isEditMode.value,
                    child: TextButton(onPressed: _.onCancelButtonTap, child: Text(AppLocalizations.of(context).cancel)),
                  )),
              Obx(() => Offstage(
                    offstage: _.isEditMode.value,
                    child: Obx(() => IconButton(
                          onPressed: _.todoItemList.isEmpty ? null : _.onDeleteButtonTap,
                          icon: const Icon(Icons.delete),
                        )),
                  )),
              Obx(() => Offstage(
                    offstage: _.isEditMode.value,
                    child: IconButton(onPressed: () => _.onAddButtonTap(context), icon: const Icon(Icons.add)),
                  )),
            ],
          ),
          body: const HomeTodoListView(),
          floatingActionButton: Obx(() => Offstage(
                offstage: !_.isEditMode.value,
                child: FloatingActionButton(
                  onPressed: () => _.onDeleteFabTap(context),
                  child: const Icon(Icons.delete),
                ),
              )),
        );
      },
    );
  }
}
