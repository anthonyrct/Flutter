import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  final bool darkMode;
  final double fontSize;
  final Locale selectedLocale;

  const TestPage({
    required this.darkMode,
    required this.fontSize,
    required this.selectedLocale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página de Teste'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tema: ${darkMode ? 'Escuro' : 'Claro'}',
              style: TextStyle(
                fontSize: fontSize,
                color: darkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tamanho da Fonte: ${fontSize.toStringAsFixed(1)}',
              style: TextStyle(fontSize: fontSize),
            ),
            SizedBox(height: 16.0),
            Text(
              'Idioma: ${selectedLocale.languageCode.toUpperCase()}',
              style: TextStyle(fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }
}
