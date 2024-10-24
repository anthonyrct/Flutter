import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sa2_configuracoes_usuario/DataBaseController.dart';
import 'Login.dart';
import 'Model.dart';
import 'configuracoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dbHelper = DatabaseHelper();
  final _formKey = GlobalKey<FormState>();

  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cadastro-de-usuario'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Navegue para a página de login ou a página inicial, conforme necessário
            },
          )
        ],
      ),
      drawer: Drawer(
        // drawer
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
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
              title: Text('Cadastro'),
              onTap: () {
                // Navegue para a página de cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            ListTile(
              title: Text('Login'),
              onTap: () {
                // Navegue para a página de login
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
            ListTile(
              title: Text('Configurações'),
              onTap: () {
                // Navegue para a página de configurações
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: FutureBuilder<List<ContactModel>>(
        future: dbHelper.getContacts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum Contato Cadastrado'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data![index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          _confirmDeleteDialog(context, contact);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          _showUserInfoDialog(context, contact);
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    // Implemente a ação desejada quando o usuário tocar no ListTile
                  },
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddContactDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Contato'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _idController,
                  decoration: InputDecoration(labelText: 'ID'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira um ID';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira um nome';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira um email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(labelText: 'Senha'),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira uma senha';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _addContact();
                  Navigator.of(context).pop();
                }
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void _addContact() async {
    // Verifique se todos os campos estão preenchidos
    if (_idController.text.isEmpty ||
        _nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _senhaController.text.isEmpty) {
      // Exiba um diálogo de alerta informando ao usuário que todos os campos devem ser preenchidos
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de Cadastro'),
            content: Text('Por favor, preencha todos os campos.'),
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
      return; // Encerre o método sem continuar
    }

    // Verifique se o usuário já existe
    final existingUser = await dbHelper.getUserByEmail(_emailController.text);
    if (existingUser != null) {
      // Exiba uma mensagem informando que o usuário já existe
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro de Cadastro'),
            content: Text(
                'Este e-mail já está em uso. Por favor, use outro e-mail.'),
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
      return; // Encerre o método sem continuar
    }

    // Se todos os campos estiverem preenchidos e o usuário não existir, continue com a adição do contato
    final newContact = ContactModel(
      id: int.parse(_idController.text),
      name: _nameController.text,
      email: _emailController.text,
      senha: _senhaController.text,
      tema: '',
      fonte: '',
      idioma: '',
    );

    dbHelper.create(newContact);
    setState(() {
      //atualiza a lista de contatos
    });
  }

  void _confirmDeleteDialog(BuildContext context, ContactModel contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Tem certeza que deseja excluir este contato?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                _deleteContact(contact); // Chama o método de exclusão
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  // Método para excluir um contato
  void _deleteContact(ContactModel contact) {
    dbHelper.delete(contact.id);
    setState(() {
      // Atualiza a lista de contatos
    });
  }

  void _showUserInfoDialog(BuildContext context, ContactModel contact) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informações do Usuário'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nome: ${contact.name}'),
              Text('Email: ${contact.email}'),
              Text('Senha: ${contact.senha}'),
              Text('Id: ${contact.id}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
