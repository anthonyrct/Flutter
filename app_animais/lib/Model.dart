class Animal {
  //atributos
  String _especie;
  String _urlFoto;
  String _urlAudio;
  //metodos e construtor
  Animal(this._especie, this._urlAudio, this._urlFoto);

  String get especie => _especie;
  String get urlFoto => _urlFoto;
  String get urlAudio => _urlAudio;

  set especie(String especie) {
    this._especie = especie;
  }

  set urlAudio(String urlAudio) {
    this._urlAudio = urlAudio;
  }

  set urlFoto(String urlFoto) {
    this._urlFoto = urlFoto;
  }
}
