import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integração de Imagens',
      home: ImageExample(),
    );
  }
}

class ImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integração de Imagens'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Exibindo imagem de uma URL externa
          Image.network(
            '../imagens/sal.png', // URL da imagem externa
            width: 150,
            height: 150,
          ),
          SizedBox(height: 20),
          // Exibindo imagem de recursos locais
          Image.asset(
            '../imagens/açucar.png', // Caminho para a imagem local
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}
