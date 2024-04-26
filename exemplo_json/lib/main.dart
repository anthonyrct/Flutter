import 'package:flutter/material.dart';

import 'View/produtos_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: "Exemplo Json",
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: HomePage(),
  ) ;
}
}
