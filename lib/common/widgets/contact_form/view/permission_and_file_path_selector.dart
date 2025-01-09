import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionAndFilePathSelector extends StatefulWidget {
  final Function(String) onFilePathSelected;

  PermissionAndFilePathSelector({required this.onFilePathSelected});

  @override
  _PermissionAndFilePathSelectorState createState() => _PermissionAndFilePathSelectorState();
}

class _PermissionAndFilePathSelectorState extends State<PermissionAndFilePathSelector> {
  bool _isLoading = false;
  String? _selectedFilePath;

  @override
  void initState() {
    super.initState();
    _checkFilePathSelected();
  }

  Future<void> _checkFilePathSelected() async {
    final prefs = await SharedPreferences.getInstance();
    final filePath = prefs.getString('contacts_file_path');
    setState(() {
      _selectedFilePath = filePath;
    });
  }

  Future<void> _requestStoragePermission() async {
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      debugPrint('Storage permission denied');
      throw Exception('Storage permission denied');
    }
  }

  Future<void> _selectFilePath() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _requestStoragePermission();

      final result = await FilePicker.platform.saveFile(
        dialogTitle: 'Save contacts file',
        fileName: 'contacts.json',
      );

      if (result != null) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('contacts_file_path', result);
        setState(() {
          _selectedFilePath = result;
        });
        widget.onFilePathSelected(result);
      } else {
        debugPrint('File path selection cancelled');
        throw Exception('File path selection cancelled');
      }
    } catch (e) {
      debugPrint('Error selecting file path: $e');
      // Show an error message to the user
      showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text('Error'),
          content: Text('Failed to select file path. Please try again.'),
          actions: [
            CupertinoDialogAction(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_isLoading)
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CupertinoActivityIndicator(),
          ),
        if (_selectedFilePath != null)
          Text('Selected file path: $_selectedFilePath')
        else
          CupertinoButton.filled(
            onPressed: _selectFilePath,
            child: Text('Select File Path'),
          ),
      ],
    );
  }
}
