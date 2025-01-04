import 'package:flutter/cupertino.dart';

final CupertinoThemeData lightTheme = CupertinoThemeData(
  primaryColor: CupertinoColors.activeBlue,
  primaryContrastingColor: const Color.fromARGB(255, 216, 216, 216),
  barBackgroundColor: CupertinoColors.white,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      color: CupertinoColors.black,
    )
  ),
);

final CupertinoThemeData darkTheme = CupertinoThemeData(
  primaryColor: CupertinoColors.activeOrange,
  primaryContrastingColor: const Color.fromARGB(255, 54, 54, 54),
  barBackgroundColor: CupertinoColors.black,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      color:CupertinoColors.white,
    ),
  ),
);