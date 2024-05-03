import 'package:exemplo_json2/Controller/produtos_controller.dart';
import 'package:exemplo_json2/Model/produtos_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:exemplo_json2/View/produto_info_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProdutosController _controller = ProdutosController();

  // @override
  // void initState() {
  //   _controller.loadProdutos();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<List<Produto>>(
                  future: _controller.loadProdutos(),
                  builder: (context, snapshot) {
                    if (_controller.produtos.isNotEmpty) {
                      return ListView.builder(
                        itemCount: _controller.produtos.length,
                        itemBuilder: (context, index) {
                          final produto = _controller.produtos[index];
                          return ListTile(
                            leading: Image.asset(produto.foto),
                            title: Text(produto.nome),
                            subtitle: Text(
                                'Preço: ${produto.preco.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProdutoInfoScreen(
                                          info: _controller.produtos[index])));
                            },
                          );
                        },
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
