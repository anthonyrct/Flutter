import 'package:app_carro/Model.dart';

class CarroController{
  List<Carro> _carroList = [
    Carro("Fiat Uno", 1992, ""),
    Carro("Classic", 2005, "")
  ];
  //gett
  List<Carro> get ListarCarros =>_carroList;

  void adicionarCarro(String modelo, int ano, String imagemUrl){
    //objeto
    Carro carro = Carro(modelo, ano, imagemUrl);
    _carroList.add(carro);
  }
}