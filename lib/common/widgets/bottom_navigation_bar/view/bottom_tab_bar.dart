import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:relatives/features/add_contacts/view/add_contacts_page.dart';
import 'package:relatives/features/home/view/home_page.dart';
import 'package:relatives/features/settings/view/settings_page.dart';

class RelativeListTabBar extends StatelessWidget {
  const RelativeListTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.home),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.add_circled),
            label: AppLocalizations.of(context)!.add,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.settings),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            switch (index) {
              case 0:
                return HomePage();
              case 1:
                return AddContactsPage();
              case 2:
                return SettingsPage();
              default:
                return HomePage();
            }
          },
        );
      },
    );
  }
}
