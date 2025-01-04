import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:relatives/common/widgets/language_picker/language_picker.dart';
import '../../../common/models/items/settings_item.dart';
import '../../../services/theme_provider_service/theme_provider.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      navigationBar: CommonAppBar(
        title: AppLocalizations.of(context)!.settings,
      ),
      child: Center(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingsItem(
              title: AppLocalizations.of(context)!.darkTheme,
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
            const SizedBox(height: 15),
            SettingsItem(
              title: AppLocalizations.of(context)!.selectLanguage,
              trailingWidget: IconButton(
                onPressed: () {
                  showCupertinoModalPopup(
                    context: context,
                    builder: (BuildContext context) => Container(
                      height: 216,
                      padding: const EdgeInsets.only(top: 6.0),
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      color: CupertinoTheme.of(context).barBackgroundColor,//CupertinoColors.systemBackground.resolveFrom(context),
                      child: SafeArea(
                        top: false,
                        child: LanguageChoose(),
                      ),
                    ),
                  );
                },
                icon: Icon(CupertinoIcons.chevron_compact_down),
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