import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout com sobreposição',
      home: OverlayLayout(),
    );
  }
}

class OverlayLayout extends StatefulWidget {
  @override
  _OverlayLayoutState createState() => _OverlayLayoutState();
}

class _OverlayLayoutState extends State<OverlayLayout> {
  bool _showOverlay = false;

  void _toggleOverlay() {
    setState(() {
      _showOverlay = !_showOverlay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout com sobreposição'),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: _toggleOverlay,
              child: Text('Mostrar/Ocultar'),
            ),
          ),
          if (_showOverlay)
            Center(
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue.withOpacity(0.5),
                child: Center(
                  child: Text(
                    'Sobreposição',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
