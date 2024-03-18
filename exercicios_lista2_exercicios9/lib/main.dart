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

class ButtonExample extends StatefulWidget {
  @override
  _ButtonExampleState createState() => _ButtonExampleState();
}

class _ButtonExampleState extends State<ButtonExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
            Text(
              'Você clicou $_counter vezes.',
              style: TextStyle(
                fontSize: 20,
                color: _counter % 2 == 0 ? Colors.blue : Colors.green, // Alterna a cor do texto com base no número de cliques
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text('ElevatedButton'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red, // Cor do texto do botão
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Espaçamento interno do botão
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text('TextButton'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue, // Cor do texto do botão
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: Text('OutlinedButton'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green, side: BorderSide(color: Colors.green), // Borda do botão
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Espaçamento interno do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}
