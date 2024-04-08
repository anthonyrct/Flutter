import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Variáveis para controlar as configurações
  bool _darkMode = false;
  double _fontSize = 16.0;
  Locale? _selectedLocale;

  // Opções para cada configuração
  final List<bool> _darkModeOptions = [false, true];
  final List<double> _fontSizeOptions = [14.0, 16.0, 18.0];
  final List<Locale> _languageOptions = [
    Locale('en', 'US'), // Inglês
    Locale('es', 'ES'), // Espanhol
    Locale('pt', 'BR'), // Português
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tema', style: Theme.of(context).textTheme.subtitle1),
            _buildThemeOptions(),
            SizedBox(height: 16.0),
            Text('Tamanho da Fonte', style: Theme.of(context).textTheme.subtitle1),
            _buildFontSizeOptions(),
            SizedBox(height: 16.0),
            Text('Idioma', style: Theme.of(context).textTheme.subtitle1),
            _buildLanguageOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOptions() {
    return Column(
      children: _darkModeOptions.map((option) {
        return RadioListTile(
          title: Text(option ? 'Escuro' : 'Claro'),
          value: option,
          groupValue: _darkMode,
          onChanged: (value) {
            setState(() {
              _darkMode = value!;
            //  try{
            //   if(option == _darkMode){
            //     MaterialApp(
            //       theme: ThemeData.dark().copyWith(
            //         textTheme: ThemeData.dark().textTheme.apply(
            //           bodyColor: Colors.white,
            //         ),
            //       ),
                  
            //     );
            //   }else {
                
            //   }
            //  }catch{

            //  }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildFontSizeOptions() {
    return Column(
      children: _fontSizeOptions.map((option) {
        return RadioListTile(
          title: Text(option.toString()),
          value: option,
          groupValue: _fontSize,
          onChanged: (value) {
            setState(() {
              _fontSize = value!;
              // Implemente a lógica para aplicar o tamanho da fonte do aplicativo aqui
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildLanguageOptions() {
    return Column(
      children: _languageOptions.map((option) {
        return RadioListTile(
          title: Text(option.languageCode.toUpperCase()),
          value: option,
          groupValue: _selectedLocale,
          onChanged: (value) {
            setState(() {
              _selectedLocale = value;
              // Implemente a lógica para aplicar o idioma do aplicativo aqui
            });
          },
        );
      }).toList(),
    );
  }
}
