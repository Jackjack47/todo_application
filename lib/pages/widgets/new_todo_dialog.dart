import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/constants.dart';
import '../../view_models/bean/landmark_item_bean.dart';
import '../../view_models/bean/todo_item_bean.dart';

class NewTodoDialog extends StatefulWidget {
  const NewTodoDialog({super.key});

  @override
  State<NewTodoDialog> createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final GlobalKey<FormFieldState> _key = GlobalKey();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  String? _validator(String? s) {
    if (s == null || s.isEmpty) {
      return AppLocalizations.of(context).todoEmptyTip;
    }
    return null;
  }

  void _confirm() {
    if (_key.currentState!.validate()) {
      final result = TodoItemBean(
        todo: _textEditingController.text,
        landmarks: [
          LandmarkItemBean(landmark: Constants.defaultLandmark, createDate: DateTime.now()),
        ],
        isAchieved: false,
        checked: false,
      );
      Navigator.of(context).pop(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppLocalizations.of(context).newTodo, style: theme.textTheme.titleLarge),
            const SizedBox(height: 20),
            TextFormField(
              key: _key,
              validator: _validator,
              textAlignVertical: TextAlignVertical.top,
              minLines: 1,
              maxLines: 4,
              controller: _textEditingController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: AppLocalizations.of(context).todoHint,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    customBorder: const StadiumBorder(),
                    splashColor: colorScheme.primary.withOpacity(.08),
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return colorScheme.primary.withOpacity(.1);
                      }
                    }),
                    onTap: () => Navigator.of(context).pop(),
                    child: Ink(
                      decoration: const ShapeDecoration(shape: StadiumBorder()),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        AppLocalizations.of(context).cancel,
                        style: textTheme.labelLarge?.copyWith(color: colorScheme.primary),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: InkWell(
                    customBorder: const StadiumBorder(),
                    splashColor: colorScheme.onPrimary.withOpacity(.08),
                    overlayColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return colorScheme.onPrimary.withOpacity(.1);
                      }
                    }),
                    onTap: _confirm,
                    child: Ink(
                      decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: colorScheme.primary,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        AppLocalizations.of(context).confirm,
                        textAlign: TextAlign.center,
                        style: textTheme.labelLarge?.copyWith(color: colorScheme.onPrimary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
