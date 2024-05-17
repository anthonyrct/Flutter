import 'package:flutter/material.dart';
import 'package:projeto_api_clima_localizacao/View/favorites_screen.dart';

import 'View/home_screen.dart';
import 'View/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Projeto clima",
      home: HomeScreen(),
      routes: {
        '/home':(context) => HomeScreen(),
        '/search':(context) => SearchScreen(),
        '/favorites':(context) => FavoritesScreen(),
      },
    );
  }
}