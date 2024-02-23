import 'package:app_lista_compra/ListaModel.dart';
import 'package:flutter/material.dart';

class ListaController extends ChangeNotifier {
  //lista de compra
  List<Listas> _compras = [];
  //getter para acessar a lista de compras
  List<Listas> get compras => _compras;

  // Método para adicionar uma nova tarefa à lista
  void adicionarCompra(String descricao) {
    // Converte a nova descrição para minúsculas
    String descricaoLowerCase = descricao.toLowerCase();

    // Verifica se a compra já existe na lista
    bool compraExistente = _compras
        .any((compra) => compra.descricao.toLowerCase() == descricaoLowerCase);

    // Se a compra não existir, adicione à lista
    if (!compraExistente) {
      _compras.add(Listas(descricao, false));
      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    } else {
      // Aqui você pode mostrar uma mensagem de erro ou tomar outra ação, se desejar
      print('Essa compra já foi adicionada!');
    }
  }

  // Método para marcar uma compra como concluída com base no índice
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].concluida = true;
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para excluir uma compra com base no índice
  void excluirCompra(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
}
