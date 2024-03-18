import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Deslizante',
      initialRoute: '/', // Rota inicial do aplicativo
      routes: {
        '/': (context) => HomePage(), // Rota para a página inicial
        '/settings': (context) => SettingsPage(), // Rota para a tela de configurações
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Deslizante'),
      ),
      drawer: Drawer( // Definição do Drawer (menu deslizante)
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader( // Cabeçalho do Drawer
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home), // Ícone à esquerda do título
              title: Text('Página Inicial'), // Texto do item
              onTap: () {
                Navigator.pop(context); // Fechar o Drawer
                Navigator.pushNamed(context, '/'); // Navegar para a página inicial
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), // Ícone à esquerda do título
              title: Text('Configurações'), // Texto do item
              onTap: () {
                Navigator.pop(context); // Fechar o Drawer
                Navigator.pushNamed(context, '/settings'); // Navegar para a tela de configurações
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Bem-vindo à página inicial!', // Corpo da página inicial
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'), // Título da tela de configurações
      ),
      body: Center(
        child: Text(
          'Aqui estão as configurações do aplicativo.', // Corpo da tela de configurações
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
