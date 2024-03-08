import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../view_models/todo_item_bean.dart';
import '../../utils/date_time_util.dart';

class HomeTodoListItem extends StatelessWidget {
  const HomeTodoListItem({
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

    return InkWell(
      onTap: onTap,
      customBorder: const Border(),
      child: Ink(
        decoration: ShapeDecoration(
          color: item.isAchieved ? colorScheme.background : colorScheme.primaryContainer,
          shape: const Border(),
        ),
        child: SafeArea(
          top: false,
          bottom: false,
          minimum: isEditMode
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
                  : Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.createDate}${item.createDate.toStringWithoutDeciSecond()}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
