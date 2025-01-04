import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final String title;

  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      middle: Text(title),
      leading: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(CupertinoIcons.back, color: CupertinoColors.white),
        onPressed: () {
          // Действие при нажатии на кнопку "Назад"
        },
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Icon(CupertinoIcons.bell, color: CupertinoColors.white),
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
