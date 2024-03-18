import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listagem Dinâmica',
      home: DynamicListExample(),
    );
  }
}

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
        title: Text('Listagem Dinâmica'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]), // Chave única para o item
            background: Container(
              color: Colors.red, // Cor de fundo ao deslizar para a esquerda
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            direction: DismissDirection.startToEnd, // Direção de deslize
            onDismissed: (direction) {
              setState(() {
                // Remove o item da lista quando deslizado
                items.removeAt(index);
              });
            },
            child: Card(
              child: ListTile(
                title: Text(items[index]),
                leading: Icon(Icons.star), // Ícone à esquerda do título
                trailing:
                    Icon(Icons.arrow_forward), // Ícone à direita do título
                onTap: () {
                  // Ação ao clicar no item da lista (opcional)
                  _editItem(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  void _editItem(int index) {
    // Exemplo de ação de edição de item
    showDialog(
      context: context,
      builder: (context) {
        String newItem = items[index];
        return AlertDialog(
          title: Text('Editar Item'),
          content: TextField(
            controller: TextEditingController(
                text: items[
                    index]), // Pré-preenche o texto com o valor atual do item
            onChanged: (value) {
              newItem =
                  value; // Atualiza o novo valor do item conforme o usuário digita
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // Atualiza o valor do item na lista
                  items[index] = newItem;
                });
                Navigator.of(context).pop(); // Fecha o diálogo
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
