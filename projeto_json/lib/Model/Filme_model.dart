// - Nome; - Text
// - Genero/categoria; - Text
// - Sinopse; - Text
// - Duração; - Int
// - Ano; - Int
// - Classificação de idade; - Int
// - Elenco (Personagens); - <Text>
// - Imagens(Capaz do filme); - <Text>

class Filme {
  //atributos
  final String nome;
  final String genero;
  final String sinopse;
  final int duracao;
  final int ano;
  final int classificacaoIdade;
  final List<String> elenco;
  final String imagens;

//construtor
  Filme(
      {required this.nome,
      required this.genero,
      required this.sinopse,
      required this.duracao,
      required this.ano,
      required this.classificacaoIdade,
      required this.elenco,
      required this.imagens});

  //metodos toJson
  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'genero': genero,
      'sinopse': sinopse,
      'duracao': duracao,
      'ano': ano,
      'classificacaoIdade': classificacaoIdade,
      'elenco': elenco,
      'imagens': imagens,
    };
  }

  factory Filme.fromJson(Map<String, dynamic> json) {
    return Filme(
      nome: json['nome'],
      genero: json['genero'],
      sinopse: json['sinopse'],
      duracao: json['duracao'],
      ano: json['ano'],
      classificacaoIdade: json['classificacaoIdade'],
      elenco: json['elenco'],
      imagens: json['imagens'],
    );
  }
}
