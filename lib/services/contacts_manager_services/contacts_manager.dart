import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart'; // Add this package to your pubspec.yaml
import 'package:permission_handler/permission_handler.dart'; // Add this package to your pubspec.yaml

class ContactManager {
  static const String _fileName = 'contacts.json';
  static const String _cacheKey = 'contacts_cache';
  static const String _filePathKey = 'contacts_file_path';

  // Public getter for _filePathKey
  static String get filePathKey => _filePathKey;

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

  Future<List<Map<String, dynamic>>> readContacts() async {
    try {
      final file = await _selectedFile;
      if (!await file.exists()) {
        debugPrint('File does not exist: ${file.path}');
        return [];
      }
      final contents = await file.readAsString();
      debugPrint('Read contacts from file: $contents');
      return List<Map<String, dynamic>>.from(jsonDecode(contents));
    } catch (e) {
      debugPrint('Error reading contacts: $e');
      return [];
    }
  }

  Future<File> writeContacts(List<Map<String, dynamic>> contacts) async {
    try {
      final file = await _selectedFile;
      final contents = jsonEncode(contacts);
      debugPrint('Writing contacts to file: $contents');
      return file.writeAsString(contents);
    } catch (e) {
      debugPrint('Error writing contacts: $e');
      rethrow;
    }
  }

  Future<void> addContact(Map<String, dynamic> contact) async {
    try {
      final contacts = await readContacts();
      contacts.add(contact);
      await writeContacts(contacts);
      await _cacheContacts(contacts);
    } catch (e) {
      debugPrint('Error adding contact: $e');
      rethrow;
    }
  }

  Future<void> _cacheContacts(List<Map<String, dynamic>> contacts) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = jsonEncode(contacts);
      debugPrint('Caching contacts: $cachedData');
      prefs.setString(_cacheKey, cachedData);
    } catch (e) {
      debugPrint('Error caching contacts: $e');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> getCachedContacts() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cachedData = prefs.getString(_cacheKey);
      if (cachedData != null) {
        debugPrint('Read cached contacts: $cachedData');
        return List<Map<String, dynamic>>.from(jsonDecode(cachedData));
      }
      return [];
    } catch (e) {
      debugPrint('Error getting cached contacts: $e');
      return [];
    }
  }

  Future<void> selectFilePath() async {
    try {
      // Request storage permissions
      var status = await Permission.storage.request();
      if (!status.isGranted) {
        debugPrint('Storage permission denied');
        throw Exception('Storage permission denied');
      }

      final result = await FilePicker.platform.saveFile(
        dialogTitle: 'Save contacts file',
        fileName: _fileName,
      );

      if (result != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(_filePathKey, result);
        debugPrint('Selected file path: $result');
      } else {
        debugPrint('File path selection cancelled');
        throw Exception('File path selection cancelled');
      }
    } catch (e) {
      debugPrint('Error selecting file path: $e');
      rethrow;
    }
  }
}
