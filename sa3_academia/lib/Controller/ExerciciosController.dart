import 'package:flutter/material.dart';
import '../Model/Exercicios.dart';

class ExerciciosController extends ChangeNotifier {
  //lista de exercicios
  List<Exercicios> _exercicios = [];
  //getter para acessar a lista de exercicios
  List<Exercicios> get exercicios => _exercicios;
  
// Método para marcar um exercicio/treino como concluído com base no índice
  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _exercicios.length) {
      _exercicios[indice].concluida = true;
      notifyListeners();
    }
  }
}
