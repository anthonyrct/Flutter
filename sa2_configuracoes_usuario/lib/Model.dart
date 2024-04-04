class ContactModel {
  int id;
  String name;
  String email;
  String senha;
  String tema;
  String idioma;
  String fonte;

  ContactModel({
    required this.id,
    required this.name,
    required this.email,
    required this.senha,
  });

  // Método para converter um contato para um mapa (para salvar no banco de dados)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'senha': senha,
    };
  }

// Método de fábrica para criar um objeto ContactModel a partir de um mapa (para ler do banco de dados)
  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}
