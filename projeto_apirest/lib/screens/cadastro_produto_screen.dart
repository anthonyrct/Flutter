import 'package:flutter/material.dart';
import 'package:projeto_apirest/controllers/produtos_controller.dart';
import 'package:projeto_apirest/model/produto.dart';

class CadastroProdutoScreen extends StatefulWidget {
  const CadastroProdutoScreen({super.key});

  @override
  State<CadastroProdutoScreen> createState() => _CadastroProdutoScreenState();
}

class _CadastroProdutoScreenState extends State<CadastroProdutoScreen> {
  final ProdutosController _controller = ProdutosController();
  final TextEditingController _nomeProduto = TextEditingController();
  final TextEditingController _precoProduto = TextEditingController();
  final TextEditingController _idProduto = TextEditingController();

  Future<void> _cadastrarProduto() async {
    try {
      Produto produto = Produto(id: _idProduto, nome: _nomeProduto.text, preco: double.parse(_precoProduto.text));
      await _controller.postProdutosToJson(produto);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}