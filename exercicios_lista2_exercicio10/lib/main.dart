import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barra de Progresso Dinâmica',
      home: ProgressBarDemo(),
    );
  }
}

class ProgressBarDemo extends StatefulWidget {
  @override
  _ProgressBarDemoState createState() => _ProgressBarDemoState();
}

class _ProgressBarDemoState extends State<ProgressBarDemo> {
  double _progressValue = 0.0;
  Color _progressColor = Colors.blue;

  void _startProgress() {
    setState(() {
      _progressValue += 0.1;
      if (_progressValue >= 1.0) {
        _progressValue = 0.0; // Reseta o progresso para 0%
        _progressColor = Colors.green; // Muda a cor da barra para verde
      } else {
        _progressColor = Colors
            .blue; // Mantém a cor azul enquanto o progresso não chega a 100%
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barra de Progresso Dinâmica'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Barra de Progresso Linear
            LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(_progressColor),
            ),
            SizedBox(height: 20),
            // Exibição da porcentagem
            Text(
              '${(_progressValue * 100).toInt()}%',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Botão para iniciar a animação de progresso
            ElevatedButton(
              onPressed: () {
                _startProgress();
              },
              child: Text('Iniciar Progresso'),
            ),
          ],
        ),
      ),
    );
  }
}
