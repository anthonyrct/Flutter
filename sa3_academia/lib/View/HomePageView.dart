import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaginaHome extends StatelessWidget {
  String email;
  PaginaHome({required this.email});

  @override
  Widget build(BuildContext context) {
    return _PaginaHomeState(email: email);
  }
}

class _PaginaHomeState extends StatefulWidget {
  final String email;

  _PaginaHomeState({required this.email});

  @override
  State<_PaginaHomeState> createState() => __PaginaHomeState();
}

class __PaginaHomeState extends State<_PaginaHomeState> {
  late SharedPreferences _prefs;
  bool exercicio1 = false;
  bool exercicio2 = false;
  bool exercicio3 = false;
  bool exercicio4 = false;
  bool exercicio5 = false;
  bool exercicio6 = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      exercicio1 = _prefs.getBool('${widget.email}exercicio1') ?? false;
      exercicio2 = _prefs.getBool('${widget.email}exercicio2') ?? false;
      exercicio3 = _prefs.getBool('${widget.email}exercicio3') ?? false;
      exercicio4 = _prefs.getBool('${widget.email}exercicio4') ?? false;
      exercicio5 = _prefs.getBool('${widget.email}exercicio5') ?? false;
      exercicio6 = _prefs.getBool('${widget.email}exercicio6') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Home'),
      ),
      body: ListView(
        children: [
          CheckboxListTile(
            title: Text('Exercício 1'),
            value: exercicio1,
            onChanged: (value) {
              setState(() {
                exercicio1 = value!;
                _prefs.setBool('${widget.email}exercicio1', exercicio1);
              });
            },
          ),
          CheckboxListTile(
            title: Text('Exercício 2'),
            value: exercicio2,
            onChanged: (value) {
              setState(() {
                exercicio2 = value!;
                _prefs.setBool('${widget.email}exercicio2', exercicio2);
              });
            },
          ),
          CheckboxListTile(
            title: Text('Exercício 3'),
            value: exercicio3,
            onChanged: (value) {
              setState(() {
                exercicio3 = value!;
                _prefs.setBool('${widget.email}exercicio3', exercicio3);
              });
            },
          ),
          CheckboxListTile(
            title: Text('Exercício 4'),
            value: exercicio4,
            onChanged: (value) {
              setState(() {
                exercicio4 = value!;
                _prefs.setBool('${widget.email}exercicio4', exercicio4);
              });
            },
          ),
          CheckboxListTile(
            title: Text('Exercício 5'),
            value: exercicio5,
            onChanged: (value) {
              setState(() {
                exercicio5 = value!;
                _prefs.setBool('${widget.email}exercicio5', exercicio5);
              });
            },
          ),
          CheckboxListTile(
            title: Text('Exercício 6'),
            value: exercicio6,
            onChanged: (value) {
              setState(() {
                exercicio6 = value!;
                _prefs.setBool('${widget.email}exercicio6', exercicio6);
              });
            },
          ),
        ],
      ),
    );
  }
}
