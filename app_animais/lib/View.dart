import 'package:app_animais/Controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaAnimais{

}
class TelaAnimalDetalhe extends StatelessWidget{
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
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
                labelText: 'Novo Animal',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarTarefa do Provider para atualizar o estado
                    Provider.of<AnimalController>(context, listen: false)
                        .adicionarAnimal(_controller.text, "","");
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
            child: Consumer<AnimalController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarAnimais.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do texto da tarefa
                      title: Text(model.listarAnimais[index].especie),
                      //onTap:(),
                      }
                      {
                          // Chamando o método marcarComoConcluida do Provider para atualizar o estado
                          model.marcarComoConcluida(index);
                        },
                      ),
                     
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }