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
        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
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
