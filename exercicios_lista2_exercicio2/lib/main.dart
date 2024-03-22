import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Classe principal que define o aplicativo
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listagem Dinâmica', // Título do aplicativo
      home:
          DynamicListExample(), // Define a página inicial como DynamicListExample
    );
  }
}

// Widget de exemplo de lista dinâmica
class DynamicListExample extends StatefulWidget {
  @override
  _DynamicListExampleState createState() => _DynamicListExampleState();
}

class _DynamicListExampleState extends State<DynamicListExample> {
  // Lista de itens fictícios
  List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem Dinâmica'), // Título da barra de aplicativos
      ),
      body: ListView.builder(
        itemCount: items.length, // Número de itens na lista
        itemBuilder: (context, index) {
          // Constrói cada item da lista
          return Dismissible(
            key: Key(items[index]), // Chave única para o item
            background: Container(
              color: Colors.red, // Cor de fundo ao deslizar para a esquerda
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white), // Ícone de lixo
            ),
            direction: DismissDirection.startToEnd, // Direção de deslize
            onDismissed: (direction) {
              setState(() {
                // Remove o item da lista quando deslizado
                items.removeAt(index);
              });
            },
            child: Card(
              // Exibe cada item em um cartão
              child: ListTile(
                title: Text(items[index]), // Texto do item
                leading: Icon(Icons.star), // Ícone à esquerda do título
                trailing:
                    Icon(Icons.arrow_forward), // Ícone à direita do título
                onTap: () {
                  // Ação ao clicar no item da lista (opcional)
                  _editItem(index); // Chama a função para editar o item
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // Função para editar um item da lista
  void _editItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String newItem =
            items[index]; // Novo item inicializado com o valor atual
        return AlertDialog(
          title: Text('Editar Item'), // Título do diálogo
          content: TextField(
            controller: TextEditingController(
                text: items[
                    index]), // Campo de texto pré-preenchido com o valor atual
            onChanged: (value) {
              newItem =
                  value; // Atualiza o novo valor do item conforme o usuário digita
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Fecha o diálogo sem salvar as alterações
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Atualiza o valor do item na lista
                  items[index] = newItem;
                });
                Navigator.of(context)
                    .pop(); // Fecha o diálogo após salvar as alterações
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
