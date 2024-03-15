import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Uso do Stack',
      home: StackExample(),
    );
  }
}

class StackExample extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Uso do Stack/exercicio 7'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.blue,
            height: 200,
            width: double.infinity,
          ),
          Positioned(
            top: 50,
            left: 50,
            child: Container(
              color: Colors.red,
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'Widget 1',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: Container(
              color: Colors.green,
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'Widget 2',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}