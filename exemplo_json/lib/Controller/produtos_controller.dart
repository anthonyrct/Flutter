import 'dart:convert';

import 'package:exemplo_json/Model/produtos_Model.dart';
import 'package:flutter/services.dart';

class ProdutoController {
  //atributo(lista de produtos)
  List<Produto> produtos = [];
 

  //metodos para codificar e decodificar json
  // Método para carregar produtos do arquivo JSON
  Future<List<Produto>> loadProdutos() async {
    // Carrega o conteúdo do arquivo JSON da pasta assets
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o conteúdo JSON em uma lista dinâmica
    final jsonList = json.decode(data) as List<dynamic>;
    produtos.clear();
    // Converte os objetos da lista Dinamica em instâncias de Produto e adiciona à lista de produtos
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));
    return produtos;
  }
}
