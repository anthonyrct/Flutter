import 'package:app_animais/Model.dart';

class AnimalController{
  //lista
  List<Animal> _listAnimal = [];

  //get da lista
  List get listarAnimais => _listAnimal;

  //adicional animal
  void adicionarAnimal(String especie,String urlFoto,String urlAudio){
    Animal novoAnimal = Animal(especie, urlAudio, urlFoto);
    _listAnimal.add(novoAnimal);
  }
}