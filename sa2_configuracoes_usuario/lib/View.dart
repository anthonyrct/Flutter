import 'package:flutter/material.dart';
import 'Model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Escolha uma opção',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escolha uma opção'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Escolha uma das opções abaixo:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {
                // Ação a ser executada quando o botão "Login" for pressionado
                print('Botão Login pressionado');
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
              onPressed: () {
                // Ação a ser executada quando o botão "Cadastro" for pressionado
                print('Botão Cadastro pressionado');
              },
              child: Text('Cadastro'),
            ),
          ],
        ),
      ),
    );
  }
}
