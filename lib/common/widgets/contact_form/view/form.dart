//обновить теекстовые элементы

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
    if (_formKey.currentState!.validate()) {
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

      widget.onAddContact(contactData);
      _clearFields();
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
    return CupertinoFormSection(
      header: Text('Contact Information'),
      children: <Widget>[
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.lastName),
          child: CupertinoTextFormFieldRow(
            controller: _lastNameController,
            placeholder: 'Enter last name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter last name';
              }
              return null;
            },
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.firstName),
          child: CupertinoTextFormFieldRow(
            controller: _firstNameController,
            placeholder: 'Enter first name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter first name';
              }
              return null;
            },
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.middleName),
          child: CupertinoTextFormFieldRow(
            controller: _middleNameController,
            placeholder: 'Enter middle name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter middle name';
              }
              return null;
            },
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.birthDate),
          child: CupertinoTextFormFieldRow(
            controller: _birthDateController,
            placeholder: 'Enter birth date',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter birth date';
              }
              return null;
            },
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.phoneNumber),
          child: CupertinoTextFormFieldRow(
            controller: _phoneNumberController,
            placeholder: 'Enter phone number',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter phone number';
              }
              return null;
            },
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.country),
          child: CupertinoTextFormFieldRow(
            controller: _countryController,
            placeholder: 'Enter country',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter country';
              }
              return null;
            },
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.region),
          child: CupertinoTextFormFieldRow(
            controller: _regionController,
            placeholder: 'Enter region',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter region';
              }
              return null;
            },
          ),
        ),
        CupertinoFormRow(
          prefix: Text(AppLocalizations.of(context)!.city),
          child: CupertinoTextFormFieldRow(
            controller: _cityController,
            placeholder: 'Enter city',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter city';
              }
              return null;
            },
          ),
        ),
        SizedBox(height: 20),
        CupertinoButton(
          onPressed: _addContact,
          child:  Text(AppLocalizations.of(context)!.addContact),
        ),
        if (widget.isLoading)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CupertinoActivityIndicator(),
          ),
      ],
    );
  }
}