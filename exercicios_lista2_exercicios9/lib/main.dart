import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personalização de Botões',
      home: ButtonExample(),
    );
  }
}

class ButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personalização de Botões'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Cor de fundo do botão
                onPrimary: Colors.white, // Cor do texto do botão
                elevation: 5, // Elevação do botão
                padding: EdgeInsets.all(16), // Espaçamento interno do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Borda arredondada
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: Text('Text Button'),
              style: TextButton.styleFrom(
                primary: Colors.green, // Cor do texto do botão
                padding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 24), // Espaçamento interno do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Borda arredondada
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              child: Text('Outlined Button'),
              style: OutlinedButton.styleFrom(
                primary: Colors.red, // Cor do texto do botão
                side: BorderSide(color: Colors.red), // Cor da borda
                padding: EdgeInsets.all(16), // Espaçamento interno do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Borda arredondada
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
