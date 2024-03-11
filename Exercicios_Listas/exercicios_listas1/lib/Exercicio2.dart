import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'exercicio 2',
      home: Scaffold(
        appBar: AppBar(
          title: Text('exercicio 2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'exercicio 2',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star),
                  Text('Widget Row'),
                  Icon(Icons.star),
                ],
              ),
              SizedBox(height: 20.0),
              Column(
                children: <Widget>[
                  Icon(Icons.access_alarm),
                  Text('Widget Column'),
                  Image.asset(
                    'assets/flutter_logo.png',
                    width: 100,
                    height: 100,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
