import 'package:app_lista_compra/ListaModel.dart';
import 'package:flutter/material.dart';

// Classe responsável por gerenciar o estado da lista de compras usando o Provider
class ListaController extends ChangeNotifier {
  // Lista de compras
  List<Listas> _compras = [];

  // Getter para acessar a lista de compras
  List<Listas> get compras => _compras;

  // Método para adicionar uma nova compra à lista
  void adicionarCompra(String descricao) {
    if (descricao.trim() != '') {
      // Verifica se a descrição não está vazia
      // Remove espaços em branco extras e converte para minúsculas para verificar se a compra já existe
      String descricaoMinuscula = descricao.trim().toLowerCase();
      List<String> descricoesExistentes =
          _compras.map((compra) => compra.descricao.toLowerCase()).toList();

      // Verifica se a descrição já existe na lista de compras (em minúsculas)
      bool jaExiste = descricoesExistentes.contains(descricaoMinuscula);

      // Se a compra já existe, mostra uma mensagem
      if (jaExiste) {
        print("Esta compra já foi adicionada!");
        return;
      }

      // Obtém a data e hora atuais
      DateTime dataHoraAtual = DateTime.now();

      // Adiciona a nova compra à lista
      _compras.add(Listas(descricao.trim(), false, dataHoraAtual));

      // Notifica os ouvintes (widgets) sobre a mudança no estado
      notifyListeners();
    }
  }

  // Método para marcar uma compra como concluída com base no índice
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _compras.length) {
      if (_compras[indice].concluida) {
        _compras[indice].concluida = false; // Altera para não concluída
      } else {
        _compras[indice].concluida = true; // Altera para concluída
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

  // Método para atualizar a quantidade de uma compra com base no índice
  void atualizarQuantidade(int indice, int quantidade) {
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].quantidade = quantidade;
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
}
