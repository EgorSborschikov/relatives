import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:relatives/features/add_contacts/view/add_contacts_page.dart';
import 'package:relatives/features/home/view/home_page.dart';
import 'package:relatives/features/settings/view/settings_page.dart';

class RelativeListTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            label: 'Добавить',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Настройки',
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
