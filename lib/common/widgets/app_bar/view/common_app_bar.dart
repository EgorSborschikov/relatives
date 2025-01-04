import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;

  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      middle: Text(
        title,
        style: CupertinoTheme.of(context).textTheme.textStyle,
      ),
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(CupertinoIcons.back, color: CupertinoTheme.of(context).primaryColor),
        onPressed: () {
          // Действие при нажатии на кнопку "Назад"
        },
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(CupertinoIcons.bell, color: CupertinoTheme.of(context).primaryColor),
        onPressed: () {
          // Действие при нажатии на кнопку "Уведомления"
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}
