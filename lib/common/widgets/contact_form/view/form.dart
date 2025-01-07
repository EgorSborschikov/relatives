import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactForm extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddContact;
  final bool isLoading;

  ContactForm({super.key, required this.onAddContact, required this.isLoading});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _middleNameController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _countryController = TextEditingController();
  final _regionController = TextEditingController();
  final _cityController = TextEditingController();

  void _addContact() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      Map<String, dynamic> contactData = {
        'lastName': _lastNameController.text,
        'firstName': _firstNameController.text,
        'middleName': _middleNameController.text,
        'birthDate': _birthDateController.text,
        'phoneNumber': _phoneNumberController.text,
        'country': _countryController.text,
        'region': _regionController.text,
        'city': _cityController.text,
      };

      if (widget.onAddContact != null) {
        widget.onAddContact(contactData);
        _clearFields();
      } else {
        debugPrint('onAddContact callback is null');
      }
    } else {
      debugPrint('Form validation failed or form key is null');
    }
  }


  void _clearFields() {
    _lastNameController.clear();
    _firstNameController.clear();
    _middleNameController.clear();
    _birthDateController.clear();
    _phoneNumberController.clear();
    _countryController.clear();
    _regionController.clear();
    _cityController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = CupertinoTheme.of(context);

    return Padding(
      padding: EdgeInsets.all(mediaQuery.size.width * 0.05),
      child: CupertinoFormSection(
        header: Text(
          AppLocalizations.of(context)!.contactInformation,
          style: theme.textTheme.textStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: theme.barBackgroundColor,
        decoration: BoxDecoration(
          color: theme.barBackgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        children: <Widget>[
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.lastName,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _lastNameController,
              placeholder: AppLocalizations.of(context)!.enterLastName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterLastName;
                }
                return null;
              },
            ),
          ),
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.firstName,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _firstNameController,
              placeholder: AppLocalizations.of(context)!.enterFirstName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterFirstName;
                }
                return null;
              },
            ),
          ),
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.middleName,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _middleNameController,
              placeholder: AppLocalizations.of(context)!.enterMiddleName,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterMiddleName;
                }
                return null;
              },
            ),
          ),
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.birthDate,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _birthDateController,
              placeholder: AppLocalizations.of(context)!.enterBirthDate,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterBirthDate;
                }
                return null;
              },
            ),
          ),
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.phoneNumber,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _phoneNumberController,
              placeholder: AppLocalizations.of(context)!.enterPhoneNumber,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterPhoneNumber;
                }
                return null;
              },
            ),
          ),
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.country,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _countryController,
              placeholder: AppLocalizations.of(context)!.enterCountry,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterCountry;
                }
                return null;
              },
            ),
          ),
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.region,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _regionController,
              placeholder: AppLocalizations.of(context)!.enterRegion,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterRegion;
                }
                return null;
              },
            ),
          ),
          CupertinoFormRow(
            prefix: Text(
              AppLocalizations.of(context)!.city,
              style: theme.textTheme.textStyle,
            ),
            child: CupertinoTextFormFieldRow(
              controller: _cityController,
              placeholder: AppLocalizations.of(context)!.enterCity,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!.pleaseEnterCity;
                }
                return null;
              },
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.02),
          CupertinoButton(
            onPressed: _addContact,
            child: Text(
              AppLocalizations.of(context)!.addContact,
              style: TextStyle(color: theme.primaryColor),
            ),
          ),
          if (widget.isLoading)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: CupertinoActivityIndicator(),
            ),
        ],
      ),
    );
  }
}