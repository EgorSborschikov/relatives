import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../services/language_provider_service/language_provider.dart';

class LanguageChoose extends StatelessWidget {
  const LanguageChoose({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    int selectedIndex = 0;

    switch (languageProvider.locale.languageCode) {
      case 'en':
        selectedIndex = 0;
        break;
      case 'ru':
        selectedIndex = 1;
        break;
      case 'de':
        selectedIndex = 2;
        break;
    }

    return Container(
      height: 150, // Установите фиксированную высоту
      child: CupertinoPicker(
        itemExtent: 32.0,
        scrollController: FixedExtentScrollController(initialItem: selectedIndex),
        onSelectedItemChanged: (int index) {
          switch (index) {
            case 0:
              languageProvider.changeLocale(Locale('en'));
              break;
            case 1:
              languageProvider.changeLocale(Locale('ru'));
              break;
            case 2:
              languageProvider.changeLocale(Locale('de'));
              break;
          }
        },
        children: [
          Text(
            'English',
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          Text(
            'Русский',
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
          Text(
            'Deutsch',
            style: CupertinoTheme.of(context).textTheme.textStyle,
          ),
        ],
      ),
    );
  }
}
