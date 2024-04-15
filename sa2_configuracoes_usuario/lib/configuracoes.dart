import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _fontSize = 16.0; // Tamanho da fonte padrão
  String _language = 'Português'; // Idioma padrão
  bool _darkTheme = false; // Tema padrão

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Slider(
              value: _fontSize,
              min: 10,
              max: 30,
              onChanged: (newValue) {
                setState(() {
                  _fontSize = newValue;
                });
              },
            ),
            DropdownButton<String>(
              value: _language,
              onChanged: (newValue) {
                setState(() {
                  _language = newValue!;
                });
              },
              items: ['Português', 'Inglês', 'Espanhol']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SwitchListTile(
              title: Text('Tema escuro'),
              value: _darkTheme,
              onChanged: (newValue) {
                setState(() {
                  _darkTheme = newValue;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                _showSaveConfirmationDialog(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSaveConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Salvar configurações?'),
          content: Text('Tem certeza que deseja salvar as configurações?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Sim'),
              onPressed: () {
                _saveSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _saveSettings() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'settings.db');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS settings (id INTEGER PRIMARY KEY, fontSize REAL, language TEXT, darkTheme INTEGER)');
    });

    // Salva as configurações no banco de dados
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT OR REPLACE INTO settings(id, fontSize, language, darkTheme) VALUES(1, $_fontSize, "$_language", ${_darkTheme ? 1 : 0})');
    });
  }
}
