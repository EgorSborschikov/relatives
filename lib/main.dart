import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:relatives/common/widgets/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:relatives/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'services/theme_provider_service/theme_provider.dart';
import 'services/language_provider_service/language_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer2<ThemeProvider, LanguageProvider>(
        builder: (context, themeProvider, languageProvider, child) {
          return CupertinoApp(
            theme: themeProvider.isDarkMode ? darkTheme : lightTheme,
            home: RelativeListTabBar(),
            debugShowCheckedModeBanner: false,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en', ''),
              Locale('ru', ''),
              Locale('de', ''),
            ],
            locale: languageProvider.locale,
          );
        },
      ),
    ),
  );
}
