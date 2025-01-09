import 'package:flutter/cupertino.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'contacts_list_page/contact_list_page.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      navigationBar: CommonAppBar(
        title: AppLocalizations.of(context)!.home,
      ),
      child: ContactListPage(),
    );
  }
}