import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold
      appBar:AppBar(
        title: Text('exercicio 01'),
      ),
      body: Column(
        children: [
          Text('Mauricio'),
          Container(
            child: Row(
              children: [
                Text('26 anos'),
                Text('rua jacinto pinto')
              ],
            ),
          )
        ],
      )
    );
  }

}