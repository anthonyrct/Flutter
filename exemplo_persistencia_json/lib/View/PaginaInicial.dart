import 'dart:convert';
import 'dart:math';

import 'package:exemplo_persistencia_json/Model/Produtos_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
final TextEditingController _nomeController = TextEditingController(),
final TextEditingController _precoController = TextEditingController(),
final TextEditingController _categoriaController = TextEditingController(),


List<produtos> _Produtos = [];

@override
void initState() {
  super.initState();
  _loadProdutos();
}



  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

 Future<void> _loadProdutos() async{
  final data = await rootBundle.loadString('assets/produtos.json');
  final jsonList = json.decode(data) as List<dynamic>;
  setState(() {
    _Produtos = jsonList.map((e) => Produtos(
 nome: e['nome'],
    preco: e['preco'],
    categoria: e['categoria'],
    )).toList();
  });
  }
  Future<void> _saveProdutos() async{
    final appDocDir = await getApplicationDcumentsDirectory();
    final filePath = '${appDocDir.path}/produtos.json';
    final jsonList = _Produtos.map((produtos) => produtos.toJson());
    await File(filePath).writeAsString(json.encode(jsonList));
  }


}
