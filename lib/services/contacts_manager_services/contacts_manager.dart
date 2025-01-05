import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactManager {
  static const String _fileName = 'contacts.json';
  static const String _cacheKey = 'contacts_cache';

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/$_fileName');
  }

  Future<List<Map<String, dynamic>>> readContacts() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return List<Map<String, dynamic>>.from(jsonDecode(contents));
    } catch (e) {
      return [];
    }
  }

  Future<File> writeContacts(List<Map<String, dynamic>> contacts) async {
    final file = await _localFile;
    final contents = jsonEncode(contacts);
    return file.writeAsString(contents);
  }

  Future<void> addContact(Map<String, dynamic> contact) async {
    final contacts = await readContacts();
    contacts.add(contact);
    await writeContacts(contacts);
    await _cacheContacts(contacts);
  }

  Future<void> _cacheContacts(List<Map<String, dynamic>> contacts) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_cacheKey, jsonEncode(contacts));
  }

  Future<List<Map<String, dynamic>>> getCachedContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(_cacheKey);
    if (cachedData != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(cachedData));
    }
    return [];
  }
}