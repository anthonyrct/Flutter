import 'package:flutter/material.dart';

class CadastroPage extends StatelessWidget {
  // Controladores para os campos de entrada
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text('Entrar', style: TextStyle(color: Colors.orange)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {},
              child: Text('Registrar', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Formulário de cadastro
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cadastro',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Campo de Nome
                  _buildTextField(_nomeController, 'Nome'),
                  SizedBox(height: 15),

                  // Campo de E-mail
                  _buildTextField(_emailController, 'E-mail', keyboardType: TextInputType.emailAddress),
                  SizedBox(height: 15),

                  // Campo de Senha
                  _buildTextField(_senhaController, 'Senha', obscureText: true),
                  SizedBox(height: 15),

                  // Campo de Confirmar Senha
                  _buildTextField(_confirmarSenhaController, 'Confirmar Senha', obscureText: true),
                  SizedBox(height: 15),

                  // Campo de Telefone
                  _buildTextField(_telefoneController, 'Telefone', keyboardType: TextInputType.phone),
                  SizedBox(height: 15),

                  // Botão de Cadastrar
                  ElevatedButton(
                    onPressed: () {
                      // Lógica para cadastrar
                    },
                    child: Text('Cadastrar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Imagem de fundo na parte inferior
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/imagem-de-fundo(cadastro-e-login).png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  // Método para criar campos de texto reutilizáveis
  Widget _buildTextField(TextEditingController controller, String label,
      {TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
        ),
      ),
    );
  }
}
