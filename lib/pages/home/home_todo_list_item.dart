import 'package:flutter/material.dart';

class HomeTodoListItem extends StatelessWidget {
  const HomeTodoListItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isEditMode,
  });

  final String title;
  final String subTitle;
  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isEditMode
            ? Checkbox(
                value: false,
                onChanged: (b) {},
              )
            : Container(),
        Column(
          children: [
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              subTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
