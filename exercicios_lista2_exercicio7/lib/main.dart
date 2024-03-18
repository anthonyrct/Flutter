import 'package:flutter/material.dart';
//Anotações:
//fazer uma função de que quando o usuario clicar, mudar os quadrados(em progresso)
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uso do Stack',
      home: StackExample(),
    );
  }
}

class StackExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Uso do Stack'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              color: Colors.blue,
              width: 200,
              height: 200,
            ),
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
            ),
            Positioned(
              bottom: 50,
              right: 50,
              child: Container(
                color: Colors.green,
                width: 150,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
