import 'package:flutter/cupertino.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final Widget trailingWidget;

  const SettingsItem({
    super.key,
    required this.title,
    required this.trailingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: CupertinoTheme.of(context).primaryContrastingColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          trailingWidget,
        ],
      ),
    );
  }
}
