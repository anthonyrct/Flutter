import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Cadastro', // Título do aplicativo
      home: RegistrationForm(), // Define a página inicial como RegistrationForm
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // Controladores para os campos de texto
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Função para enviar o formulário
  void _submitForm() {
    // Obter os valores dos campos de texto
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Enviar os dados do usuário para algum lugar, possivelmente um banco de dados (em progresso)

    // Exibir os dados no console
    print('Nome: $name');
    print('E-mail: $email');
    print('Senha: $password');

    // Limpar os campos após enviar o formulário
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Cadastro'), // Título da barra de aplicativos
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Campo de texto para o nome
            TextField(
              controller: _nameController, // Controlador para o campo de texto
              decoration: InputDecoration(
                labelText: 'Nome', // Rótulo do campo de texto
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre os campos de texto
            // Campo de texto para o e-mail
            TextField(
              controller: _emailController, // Controlador para o campo de texto
              decoration: InputDecoration(
                labelText: 'E-mail', // Rótulo do campo de texto
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre os campos de texto
            // Campo de texto para a senha
            TextField(
              controller: _passwordController, // Controlador para o campo de texto
              decoration: InputDecoration(
                labelText: 'Senha', // Rótulo do campo de texto
              ),
              obscureText: true, // Para ocultar a senha
            ),
            SizedBox(height: 20), // Espaçamento entre os campos de texto
            // Botão para enviar o formulário
            ElevatedButton(
              onPressed: _submitForm, // Função chamada quando o botão é pressionado
              child: Text('Enviar'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose dos controladores quando o widget for destruído para evitar vazamentos de memória
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
