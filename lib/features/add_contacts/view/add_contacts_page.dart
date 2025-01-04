import 'package:flutter/cupertino.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddContactsPage extends StatelessWidget{
  const AddContactsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      navigationBar: CommonAppBar(
        title: AppLocalizations.of(context)!.addContact,
      ),
      child: Center(

      )
    );
  }
}