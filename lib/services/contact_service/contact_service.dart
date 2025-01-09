import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/models/contacts/contact_list/contacts_list_model.dart';

class ContactService {
  static const String _fileName = 'contacts.json';
  static const String _filePathKey = 'contacts_file_path';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<File> get _selectedFile async {
    final prefs = await SharedPreferences.getInstance();
    final filePath = prefs.getString(_filePathKey);
    if (filePath != null) {
      return File(filePath);
    }
    return _localFile;
  }

  Future<List<Contact>> readContacts() async {
    try {
      final file = await _selectedFile;
      final contents = await file.readAsString();
      final List<dynamic> jsonList = jsonDecode(contents);
      return jsonList.map((json) => Contact.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error reading contacts: $e');
      return [];
    }
  }
}
