import 'package:empty/screens/home_screen.dart';
import 'package:empty/screens/registro_screen.dart';
import 'package:flutter/material.dart';
import 'package:empty/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: 'Teste firebase app',
      home: HomeScreen(),
      routes: {
        '/login' :(context) => const LoginScreen(),
        '/registro' :(context) => const RegistroScreen(),
      },
   );
  }

}
