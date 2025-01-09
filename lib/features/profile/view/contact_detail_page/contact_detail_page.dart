import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';
import '../../../../common/models/contacts/contact_list/contacts_list_model.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailPage({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);
    final localizations = AppLocalizations.of(context)!;

    return CupertinoPageScaffold(
      backgroundColor: theme.barBackgroundColor,
      navigationBar: CommonAppBar(
        title: localizations.contactDetails,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoListSection.insetGrouped(
              header: Text(localizations.personalInformation, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              children: [
                CupertinoListTile(
                  title: Text(localizations.lastName),
                  subtitle: Text(contact.lastName),
                ),
                CupertinoListTile(
                  title: Text(localizations.firstName),
                  subtitle: Text(contact.firstName),
                ),
                CupertinoListTile(
                  title: Text(localizations.middleName),
                  subtitle: Text(contact.middleName),
                ),
                CupertinoListTile(
                  title: Text(localizations.phoneNumber),
                  subtitle: Text(contact.phoneNumber),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            CupertinoListSection.insetGrouped(
              header: Text(localizations.locationInformation, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              children: [
                CupertinoListTile(
                  title: Text(localizations.country),
                  subtitle: Text(contact.country),
                ),
                CupertinoListTile(
                  title: Text(localizations.region),
                  subtitle: Text(contact.region),
                ),
                CupertinoListTile(
                  title: Text(localizations.city),
                  subtitle: Text(contact.city),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            CupertinoListSection.insetGrouped(
              header: Text(localizations.additionalInformation, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              children: [
                CupertinoListTile(
                  title: Text(localizations.birthDate),
                  subtitle: Text(contact.birthDate),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
