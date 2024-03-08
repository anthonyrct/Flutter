import 'package:app_lista_compra/ListaController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaScreen extends StatelessWidget {
  // Controlador para o campo de texto de nova compra
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
        backgroundColor: Colors.red,
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
// Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nova Compra',
// Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
// Chamando o método adicionarTarefa do Provider para atualizar o estado

                    Provider.of<ListaController>(context, listen: false)
                        .adicionarCompra(_controller.text);
// Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
// Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, index) {
                    return ListTile(
// Exibição do texto da tarefa
                      title: Row(
                        children: [
                          Text(model.compras[index].descricao),
                          SizedBox(width: 10),
                          Row(children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                // Reduz a quantidade quando o botão de remoção é pressionado
                                if (model.compras[index].quantidade > 1) {
                                  model.atualizarQuantidade(index,
                                      model.compras[index].quantidade - 1);
                                }
                              },
                            ),
                            Text(
                                '${model.compras[index].quantidade}'), // Exibição da quantidade
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                // Aumenta a quantidade quando o botão de adição é pressionado
                                model.atualizarQuantidade(
                                    index, model.compras[index].quantidade + 1);
                              },
                            ),
                          ]),
                        ],
                      ),
// Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.compras[index].concluida,
                        onChanged: (value) {
// Chamando o método marcarComoConcluida do Provider para atualizar o estado

                          model.marcarComoConcluida(index);
                        },
                      ),
                      // Ícone de lixeira para excluir a compra
                      leading: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // Chamando o método excluirCompra do Provider para remover a compra da lista
                          model.excluirCompra(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  //codigo para fazer o usuario digitar com o teclado(em progresso)
//   TextField(
//   controller: _controller,
//   decoration: InputDecoration(
//     labelText: 'Nova Tarefa',
//     suffixIcon: IconButton(
//       onPressed: () {
//         _adicionarTarefa();
//       },
//       icon: Icon(Icons.add),
//     ),
//   ),
//   onSubmitted: (_) {
//     _adicionarTarefa();
//   },
// ),
}
