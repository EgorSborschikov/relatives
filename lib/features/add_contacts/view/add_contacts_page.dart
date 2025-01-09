import 'package:flutter/cupertino.dart';
import 'package:relatives/common/widgets/app_bar/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../common/widgets/contact_form/contact_form.dart';
import '../../../common/widgets/contact_form/view/permission_and_file_path_selector.dart';
import '../../../services/contacts_manager_services/contacts_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddContactsPage extends StatefulWidget {
  const AddContactsPage({super.key});

  @override
  State<AddContactsPage> createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  bool _isLoading = false;
  final ContactManager _contactManager = ContactManager();
  bool _filePathSelected = false;

  @override
  void initState() {
    super.initState();
    _checkFilePathSelected();
  }

  Future<void> _checkFilePathSelected() async {
    final prefs = await SharedPreferences.getInstance();
    final filePath = prefs.getString(ContactManager.filePathKey);
    setState(() {
      _filePathSelected = filePath != null;
    });
    debugPrint('FilePath selected: $_filePathSelected');
  }

  Future<void> _addContact(Map<String, dynamic> contactData) async {
    setState(() {
      _isLoading = true;
    });

    debugPrint('Adding contact: $contactData');

    if (!_filePathSelected) {
      setState(() {
        _isLoading = false;
      });
      // Show an error message to the user
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(AppLocalizations.of(context)!.error),
          content: Text(AppLocalizations.of(context)!.filePathSelectionRequired),
          actions: [
            CupertinoDialogAction(
              child: Text(AppLocalizations.of(context)!.ok),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
      return;
    }

    await _contactManager.addContact(contactData);

    setState(() {
      _isLoading = false;
    });

    // Show a success message to the user
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(AppLocalizations.of(context)!.success),
        content: Text(AppLocalizations.of(context)!.contactAddedSuccessfully),
        actions: [
          CupertinoDialogAction(
            child: Text(AppLocalizations.of(context)!.ok),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _onFilePathSelected(String filePath) {
    setState(() {
      _filePathSelected = true;
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              PermissionAndFilePathSelector(onFilePathSelected: _onFilePathSelected),
              ContactForm(
                onAddContact: _addContact,
                isLoading: _isLoading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
