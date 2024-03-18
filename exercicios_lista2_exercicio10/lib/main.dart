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
  double _progressValue = 0.0; // Valor inicial da barra de progresso
  Color _progressColor = Colors.blue; // Cor inicial da barra de progresso

  void _startProgress() {
    setState(() {
      _progressValue += 0.1; // Incrementa o valor da barra de progresso em 10%
      if (_progressValue >= 1.0) {
        _progressValue = 0.0; // Reseta o progresso para 0% quando atinge 100%
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
              value: _progressValue, // Valor atual da barra de progresso
              backgroundColor:
                  Colors.grey[300], // Cor de fundo da barra de progresso
              valueColor: AlwaysStoppedAnimation<Color>(
                  _progressColor), // Cor da barra de progresso
            ),
            SizedBox(height: 20),
            // Exibição da porcentagem
            Text(
              '${(_progressValue * 100).toInt()}%', // Exibe a porcentagem arredondada para o inteiro mais próximo
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
