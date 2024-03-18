import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Responsivo',
      home: ResponsiveLayoutDemo(),
    );
  }
}

class ResponsiveLayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Responsivo'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Se a largura da tela for menor que 600, exibir uma coluna
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Este é um layout responsivo.',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Tela pequena',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            } else {
              // Se a largura da tela for maior ou igual a 600, exibir uma linha
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Este é um layout responsivo.',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Tela grande',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
