import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main(){
  runApp((MyApp));
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold
      appBar: AppBar(
        title: Text("Exercicio 2"),
      ),
      body:Column(children: [Row(
        child: Text("oi"),
        width: 100,
        height:110,
        alignment: Alignment.centerLeft
      ),
      Column(Row(
        child: Text("olá"),
        alignment:Alignment.bottomLeft,
        width:120,
        height:100,
      )

      )
      ],
      )
    );
  }
}