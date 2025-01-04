import 'package:flutter/cupertino.dart';

//const widgets_primary_color = CupertinoColors.white;

final CupertinoThemeData lightTheme = CupertinoThemeData(
  primaryColor: CupertinoColors.activeBlue,
  barBackgroundColor: CupertinoColors.white,
  textTheme: CupertinoTextThemeData(
    primaryColor: CupertinoColors.black,
  ),
);

final CupertinoThemeData darkTheme = CupertinoThemeData(
  primaryColor: CupertinoColors.activeOrange,
  barBackgroundColor: CupertinoColors.black,
  textTheme: CupertinoTextThemeData(
    primaryColor: CupertinoColors.white,
  ),
);