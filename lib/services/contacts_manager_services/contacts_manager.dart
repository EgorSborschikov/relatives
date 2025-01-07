import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

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
      debugPrint('Read contacts from file: $contents');
      return List<Map<String, dynamic>>.from(jsonDecode(contents));
    } catch (e) {
      debugPrint('Error reading contacts: $e');
      return [];
    }
  }

  Future<File> writeContacts(List<Map<String, dynamic>> contacts) async {
    final file = await _localFile;
    final contents = jsonEncode(contacts);
    debugPrint('Writing contacts to file: $contents');
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
    final cachedData = jsonEncode(contacts);
    debugPrint('Caching contacts: $cachedData');
    prefs.setString(_cacheKey, cachedData);
  }

  Future<List<Map<String, dynamic>>> getCachedContacts() async {
    final prefs = await SharedPreferences.getInstance();
    final cachedData = prefs.getString(_cacheKey);
    if (cachedData != null) {
      debugPrint('Read cached contacts: $cachedData');
      return List<Map<String, dynamic>>.from(jsonDecode(cachedData));
    }
    return [];
  }
}
