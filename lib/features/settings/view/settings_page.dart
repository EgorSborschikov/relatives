import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';

import '../../../common/models/items/settings_item.dart';
import '../../../services/theme_provider_service/theme_provider.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CommonAppBar(
        title: 'Настройки',
      ),
      child: Center(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingsItem(
              title: 'Темная тема',
              trailingWidget: Consumer<ThemeProvider>(
                builder: (context, themeProvider, child) {
                  return CupertinoSwitch(
                    value: themeProvider.isDarkMode,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    },
                  );
                },
              ),
            ),
            // Добавьте другие элементы настроек здесь
          ],
        ),
      ),
      )
    );
  }
}