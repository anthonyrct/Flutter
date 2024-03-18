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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Carregando uma imagem de uma URL externa (substitua pela sua URL correta)
            Image.network(
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.flaticon.com%2Fbr%2Ficone-gratis%2Fletra-o_6156308&psig=AOvVaw3P8RVz0hSjPXuYweGF8RIr&ust=1710870869060000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCKismo-x_oQDFQAAAAAdAAAAABAQ', // URL da imagem externa
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            // Carregando uma imagem de recursos locais (substitua pelo caminho correto)
            Image.asset(
              'assets/1.png', // Caminho para a imagem local
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
