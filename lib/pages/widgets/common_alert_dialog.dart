import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommonAlertDialog extends StatelessWidget {
  const CommonAlertDialog({
    super.key,
    required this.title,
    this.content,
    this.contentText,
    this.onConfirmTap,
    this.onCancelTap,
  });

  final String title;
  final Widget? content;
  final String? contentText;
  final VoidCallback? onCancelTap;
  final VoidCallback? onConfirmTap;

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
            Text(title, style: theme.textTheme.titleLarge),
            const SizedBox(height: 20),
            if (content != null) content! else Text(contentText ?? ''),
            if (content != null || contentText != null) const SizedBox(height: 16) else const SizedBox(),
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
                    onTap: onCancelTap ?? () => Navigator.of(context).pop(),
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
                    onTap: onConfirmTap,
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
