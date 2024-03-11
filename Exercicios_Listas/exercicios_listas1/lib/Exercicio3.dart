import 'package:flutter/material.dart';

void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 3',
      home: Scaffold(
        appBar: AppBar(
          title: Text('exercicio 3'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person),
                ),
                title: Text('Item $index'),
                subtitle: Text('Informações ficticias'),
                onTap: () {},
              ),
            );
          },
        ),
      ),
    );
  }
}
