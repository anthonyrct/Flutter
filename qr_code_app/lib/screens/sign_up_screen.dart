import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nomeController = TextEditingController();
  final _blocoController = TextEditingController();
  final _numeroApartamentoController = TextEditingController();
  final _cpfController = TextEditingController();
  final _authService = AuthService();

  // Função para validar email
  bool _isEmailValid(String email) {
    return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email);
  }

  // Função para validar CPF (apenas formato básico)
  bool _isCpfValid(String cpf) {
    return RegExp(r'^\d{11}$').hasMatch(cpf);
  }

  // Função de cadastro com tratamento de erros
  void _signUp() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String nome = _nomeController.text.trim();
    String bloco = _blocoController.text.trim();
    String numeroApartamento = _numeroApartamentoController.text.trim();
    String cpf = _cpfController.text.trim();

    // Validações de entrada
    if (nome.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        bloco.isEmpty ||
        numeroApartamento.isEmpty ||
        cpf.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, preencha todos os campos.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (!_isEmailValid(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email inválido.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('A senha deve ter pelo menos 6 caracteres.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    if (!_isCpfValid(cpf)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('CPF inválido. Deve conter 11 dígitos.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      // Cria o usuário no Firebase Authentication
      await _authService.signUp(
          nome, email, password, bloco, numeroApartamento, cpf);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
          backgroundColor: Colors.green,
        ),
      );

      // Define os dados do morador para o Firestore
      Map<String, dynamic> moradorData = {
        'nome': nome,
        'email': email,
        'cpf': cpf,
        'bloco': bloco,
        'numeroApartamento': numeroApartamento,
      };

      // Tenta adicionar o morador ao Firestore
      try {
        await FirebaseFirestore.instance
            .collection('apartamentos')
            .doc('${bloco}_${numeroApartamento}')
            .collection('moradores')
            .add(moradorData);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Dados do morador salvos com sucesso!'),
            backgroundColor: Colors.green,
          ),
        );

        // Redireciona para a tela de login
        await Future.delayed(Duration(seconds: 1));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPageScreen()),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Erro ao salvar dados do morador: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'email-already-in-use') {
        errorMessage = 'Este email já está em uso.';
      } else if (e.code == 'weak-password') {
        errorMessage = 'A senha é muito fraca.';
      } else {
        errorMessage = 'Erro no cadastro: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ocorreu um erro. Tente novamente.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Espaçamento entre os campos
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Espaçamento entre os campos
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10), // Espaçamento entre os campos
            TextField(
              controller: _blocoController,
              decoration: InputDecoration(
                labelText: 'Bloco',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Espaçamento entre os campos
            TextField(
              controller: _numeroApartamentoController,
              decoration: InputDecoration(
                labelText: 'Número Apartamento',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 10), // Espaçamento entre os campos
            TextField(
              controller: _cpfController,
              decoration: InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signUp,
              child: Text('Cadastrar'),
            ),
            SizedBox(height: 20), // Espaçamento para separação
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Já possui uma conta? '),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPageScreen()),
                    );
                  },
                  child: Text(
                    'Faça seu login',
                    style: TextStyle(
                      color: Colors.blue, // Cor para indicar que é um link
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
