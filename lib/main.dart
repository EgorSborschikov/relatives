import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:relatives/common/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:relatives/themes/themes.dart';

import 'services/theme_provider_service/theme_provider.dart';

void main() {
  runApp(
    //const RealtiveListApp()
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return CupertinoApp(
            theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
            home: RelativeListTabBar(),
          );
        },
      ),
    ),
  );
}
