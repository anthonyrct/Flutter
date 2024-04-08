import 'package:flutter/material.dart';

import 'View.dart'; // Importe a página inicial do seu aplicativo

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Método para validar as credenciais
  bool _validateCredentials(String username, String password) {
    // Simulação de validação de credenciais
    return username == 'usuario' && password == 'senha';
  }

  // Método para autenticar o usuário
  void _authenticateUser() {
    final String username = _usernameController.text;
    final String password = _passwordController.text;

    if (_validateCredentials(username, password)) {
      // Credenciais válidas, navegue para a página inicial
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Credenciais inválidas, exiba uma mensagem de erro
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de Autenticação'),
            content: Text('Credenciais inválidas. Por favor, tente novamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuário',
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _authenticateUser,
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
