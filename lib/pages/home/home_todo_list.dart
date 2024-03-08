import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_application/pages/home/home_todo_list_item.dart';

import 'home_controller.dart';
import '../../utils/date_time_util.dart';

class HomeTodoList extends StatelessWidget {
  const HomeTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (_) => Obx(() {
        final data = _.todoItemList;
        final isEditMode = _.isEditMode.value;
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            final item = data[index];
            return HomeTodoListItem(
              title: item.name,
              subTitle: '${AppLocalizations.of(context)!.createDate}${item.createDate.toStringWithoutDeciSecond()}',
              isEditMode: isEditMode,
            );
          },
          itemCount: data.length,
        );
      }),
    );
  }
}
