import 'package:app_lista_compra/ListaController.dart';
import 'package:app_lista_compra/ListaView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Cores.dart';

// Classe principal que define o aplicativo
class ListaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // Retorna um MaterialApp, que é o widget principal para construir um aplicativo Flutter
      home: ChangeNotifierProvider( // Fornecedor de mudanças que fornece uma instância do ListaController para seus descendentes
        create: (context) => ListaController(), // Cria uma instância do ListaController
        child: ListaScreen(), // Define o filho como ListaScreen, que é a tela principal do aplicativo
        
      ),
    );
  }
}
