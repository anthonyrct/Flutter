import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> _items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic ListView Example'),
        ),
        body: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(_items[index]),
                subtitle: Text('Informações fictícias'),
                onTap: () {
                  // Ação ao clicar no item
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
