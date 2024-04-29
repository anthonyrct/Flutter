import 'dart:convert';

import 'package:exemplo_json2/Model/produtos_model.dart';
import 'package:flutter/services.dart';

class ProdutosController {
  //atributos
  List<Produto> produtos = [];

  //
  Future<List<Produto>> loadProdutos() async {
    //carregando os dados do arquivo
    final data = await rootBundle.loadString('assets/produtos.json');
    // Decodifica o Conteudo JSON em uma Lista Dinamica
    final jsonList = json.decode(data) as List<dynamic>;
    //Converte os objetos Json em instancias de produto e adiciona á lista
    produtos.addAll(jsonList.map((e) => Produto.fromJson(e)));

    return produtos;
  }
}
