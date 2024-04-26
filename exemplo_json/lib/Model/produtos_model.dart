import 'dart:convert';

class Produto {
  //atributos
  final String nome;
  final double preco;
  final String categoria;

  //construtor
  Produto({required this.nome, required this.preco, required this.categoria});

  //metodos de mapeamento(tojson, fromjson)
  Map<String, dynamic> toJson() =>
      {'nome': nome, 'preco': preco, 'categoria': categoria};
  //factory
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'],
      preco: json['preco'],
      categoria: json['categoria'],
    );
  }
}
