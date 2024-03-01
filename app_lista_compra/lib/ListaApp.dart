import 'package:app_lista_compra/ListaController.dart';
import 'package:app_lista_compra/ListaView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaApp extends StatelessWidget {
 @override
 Widget build(BuildContext context){
  return MaterialApp(

    home: ChangeNotifierProvider(
      create: (context) => ListaController(),
      child: ListaScreen(),
    ),
  );
 }
}
