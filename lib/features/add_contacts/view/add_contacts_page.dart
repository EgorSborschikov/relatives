import 'package:flutter/cupertino.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../common/widgets/contact_form/contact_form.dart';
import '../../../services/contacts_manager_services/contacts_manager.dart';

class AddContactsPage extends StatefulWidget{
  const AddContactsPage({super.key});

  @override
  State<AddContactsPage> createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  bool _isLoading = false;
  final ContactManager _contactManager = ContactManager();

  Future<void> _addContact(Map<String, dynamic> contactData) async {
    setState(() {
      _isLoading = true;
    });

    await _contactManager.addContact(contactData);

    setState(() {
      _isLoading = false;
  });
}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      navigationBar: CommonAppBar(
        title: AppLocalizations.of(context)!.addContact,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ContactForm(
          onAddContact: _addContact,
          isLoading: _isLoading,
        ),
      ),
    );
  }
}