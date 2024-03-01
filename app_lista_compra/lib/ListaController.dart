import 'package:app_lista_compra/ListaModel.dart';
import 'package:flutter/material.dart';

class ListaController extends ChangeNotifier {
  //lista de compra
  List<Listas> _compras = [];
  //getter para acessar a lista de compras
  List<Listas> get compras => _compras;

  // Método para adicionar uma nova tarefa à lista
  void adicionarCompra(String descricao) {
    if (descricao.trim() != '') {
      // Convertendo a descrição atual e as descrições existentes na lista para minúsculas
      String descricaoMinuscula = descricao.trim().toLowerCase();
      List<String> descricoesExistentes =
          _compras.map((compra) => compra.descricao.toLowerCase()).toList();

      // Verifica se a descrição já existe na lista de compras (em minúsculas)
      bool jaExiste = descricoesExistentes.contains(descricaoMinuscula);

      // Se a compra já existe notifica para o usuario
      if (jaExiste) {
        print("essa compra já foi adicionada!");
        return;
      }

      DateTime dataHoraAtual = DateTime.now(); // Obtém a data e hora atuais
      _compras.add(Listas(descricao.trim(), false, dataHoraAtual));

      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para marcar uma compra como concluída com base no índice
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      if (_compras[indice].concluida) {
        _compras[indice].concluida = false;
      } else {
        _compras[indice].concluida = true;
      }

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

  void atualizarQuantidade(int indice, int quantidade) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].quantidade = quantidade;
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
}
