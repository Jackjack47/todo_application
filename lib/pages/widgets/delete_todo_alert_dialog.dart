import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common_alert_dialog.dart';

class DeleteTodoAlertDialog extends StatelessWidget {
  const DeleteTodoAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonAlertDialog(
      title: AppLocalizations.of(context).deleteTodoAlertDialogTitle,
      contentText: AppLocalizations.of(context).deleteAlertDialogMessage,
      onConfirmTap: () => Navigator.of(context).pop(true),
      onCancelTap: () => Navigator.of(context).pop(false),
    );
  }
}
