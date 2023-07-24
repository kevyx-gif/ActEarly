import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//futures import
import 'package:actearly/utils/futures.dart';

//pages import
import 'package:actearly/main.dart';
import 'package:actearly/pages/another_pages/terms&cond.dart';

//dialogs
import 'package:quickalert/quickalert.dart';

class LanguageSelectionWidget extends StatefulWidget {
  @override
  _LanguageSelectionWidgetState createState() =>
      _LanguageSelectionWidgetState();
}

class _LanguageSelectionWidgetState extends State<LanguageSelectionWidget> {
  static const String _defaultLanguageKey = 'default_language';
  static const String _defaultLanguage = 'English';

  String _selectedLanguage = _defaultLanguage;

  @override
  void initState() {
    super.initState();
    _getDefaultLanguage();
  }

  Future<void> _getDefaultLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? language = prefs.getString(_defaultLanguageKey);
    if (language != null) {
      setState(() {
        _selectedLanguage = language;
      });
    }
  }

  Future<void> _setDefaultLanguage(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_defaultLanguageKey, language);
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seleccionar Idioma'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLanguageButton('English'),
            _buildLanguageButton('Español'),
            _buildLanguageButton('Français'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(String language) {
    return ElevatedButton(
      onPressed: () async {
        await _setDefaultLanguage(language);
        print('Lenguaje predeterminado: $_selectedLanguage');
        QuickAlert.show(
            context: context,
            type: QuickAlertType.confirm,
            text: 'Are you sure you should choose this language?',
            confirmBtnText: 'Yes',
            cancelBtnText: 'No',
            confirmBtnColor: Colors.green,
            onConfirmBtnTap: () async {
              chooseLanguaje();
            });
      },
      child: Text(language),
    );
  }
}
