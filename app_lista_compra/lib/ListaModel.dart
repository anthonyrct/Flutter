// Define uma classe para representar cada item da lista de compras
class Listas {
  //atributos
  String descricao; // Descrição da compra
  bool concluida; // Indica se a compra foi concluída
  int quantidade; // Quantidade da compra (sempre começa em 1)
  DateTime dataHora; // Data e hora da criação da compra

// Construtor da classe com parâmetros para a quantidade, data, Hora, descricao, concluida
  Listas(this.descricao, this.concluida, this.dataHora, {this.quantidade = 1});
}
