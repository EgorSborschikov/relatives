import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:relatives/features/profile/profile.dart';
import 'package:relatives/common/models/contacts/contact_list/contacts_list_model.dart';
import '../../../../services/contact_service/contact_service.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({super.key});

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  final ContactService _contactService = ContactService();
  late Future<List<Contact>> _contactsFuture;

  @override
  void initState() {
    super.initState();
    _contactsFuture = _contactService.readContacts();
  }

  void _navigateToContactDetail(Contact contact) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ContactDetailPage(contact: contact),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      backgroundColor: CupertinoTheme.of(context).barBackgroundColor,
      child: FutureBuilder<List<Contact>>(
        future: _contactsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text(localizations.errorLoadingContacts));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text(localizations.noContactsAvailable));
          } else {
            final contacts = snapshot.data!;
            return CupertinoListSection.insetGrouped(
              header: Text(localizations.myContacts, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              children: List.generate(contacts.length, (index) {
                final contact = contacts[index];
                return CupertinoListTile(
                  title: Text('${contact.lastName} ${contact.firstName}'),
                  subtitle: Text(contact.phoneNumber),
                  onTap: () => _navigateToContactDetail(contact),
                );
              }),
            );
          }
        },
      ),
    );
  }
}
