import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../features/add_contacts/add_contacts.dart';
import '../../../../features/home/home.dart';
import '../../../../features/settings/settings.dart';


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
