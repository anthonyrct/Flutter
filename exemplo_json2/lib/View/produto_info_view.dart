import 'package:flutter/material.dart';
import 'package:exemplo_json2/Model/produtos_model.dart';

class ProdutoInfoScreen extends StatelessWidget {
  Produto info;
  ProdutoInfoScreen({required this.info});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Produto: ${info.nome}'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Image.asset(info.foto),
            Text(info.nome),
            Text('${info.preco}'),
            Text(info.categoria),
          ],
        ),
      ),
    );
  }
}
