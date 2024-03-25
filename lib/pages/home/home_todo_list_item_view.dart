import 'package:flutter/material.dart';

import '../../view_models/bean/todo_item_bean.dart';
import '../../utils/date_time_util.dart';

class HomeTodoListItemView extends StatelessWidget {
  const HomeTodoListItemView({
    super.key,
    this.onTap,
    required this.item,
    required this.isEditMode,
  });

  final TodoItemBean item;
  final bool isEditMode;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final containerColor = item.isAchieved ? colorScheme.tertiaryContainer : colorScheme.primaryContainer;
    final onContainerColor = item.isAchieved ? colorScheme.onTertiaryContainer : colorScheme.onPrimaryContainer;

    return InkWell(
      onTap: onTap,
      customBorder: const Border(),
      splashColor: onContainerColor.withOpacity(.08),
      overlayColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed)) {
          return onContainerColor.withOpacity(.1);
        }
      }),
      child: Ink(
        decoration: ShapeDecoration(
          color: containerColor,
          shape: const Border(),
        ),
        padding: isEditMode
            ? const EdgeInsets.fromLTRB(0, 12, 16, 12)
            : const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            isEditMode
                ? IgnorePointer(
                    child: Checkbox(
                      value: item.checked,
                      onChanged: (b) {},
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.todo,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.headlineMedium?.copyWith(color: onContainerColor),
                  ),
                  Text.rich(
                    TextSpan(
                      text: '${item.landmarks.first.createDate.toStringWithoutSecond()}  ',
                      children: [
                        TextSpan(text: item.landmarks.first.landmark),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                    style: textTheme.bodyMedium?.copyWith(color: onContainerColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
