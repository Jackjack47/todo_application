import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../view_models/bean/landmark_item_bean.dart';
import '../../view_models/bean/todo_item_bean.dart';
import '../../utils/date_time_util.dart';
import 'todo_detail_controller.dart';

class TodoDetailPage extends StatelessWidget {
  const TodoDetailPage({super.key, required this.item});

  final TodoItemBean item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GetBuilder(
      init: TodoDetailController(item),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).detail),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Obx(() {
            final landmarks = _.item.value.landmarks;
            final landmarkWidgets = landmarks
                .map((e) => _LandmarkItemView(key: ValueKey(e.createDate), item: e))
                .expand<Widget>((e) => [const SizedBox(height: 8), e])
                .toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context).todo, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                TextFormField(
                  initialValue: item.todo,
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16),
                Text(AppLocalizations.of(context).landmark, style: theme.textTheme.titleMedium),
                const SizedBox(height: 4),
                const _AddLandmarkTile(),
                ...landmarkWidgets,
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _AddLandmarkTile extends StatelessWidget {

  const _AddLandmarkTile();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GetBuilder<TodoDetailController>(
      builder: (_) => ListTile(
        onTap: () {
          FocusScope.of(context).nextFocus();
          _.addLandmarkTileTap(context);
        },
        shape: OutlineInputBorder(borderSide: BorderSide(color: colorScheme.secondaryContainer, width: 2)),
        title: Icon(Icons.add, color: colorScheme.secondaryContainer),
      ),
    );
  }
}

class _LandmarkItemView extends StatelessWidget {
  const _LandmarkItemView({super.key, required this.item});

  final LandmarkItemBean item;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: '${item.createDate.toStringWithoutDeciSecond()}\n${item.landmark}',
      readOnly: true,
      minLines: 1,
      maxLines: 999,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
