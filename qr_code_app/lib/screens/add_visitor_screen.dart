import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class AddVisitorScreen extends StatefulWidget {
  @override
  _AddVisitorScreenState createState() => _AddVisitorScreenState();
}

class _AddVisitorScreenState extends State<AddVisitorScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  String? _qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Visitante')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _cpfController,
              decoration: InputDecoration(
                labelText: 'CPF',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _qrData = _generateQrData();
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrData = _generateQrData();
                });
              },
              child: Text('Salvar Visitante'),
            ),
            SizedBox(height: 20),
            if (_qrData != null) ...[
              Text('QR Code do Visitante:'),
              SizedBox(height: 10),
              QrImage(
                data: _qrData!, // Usando QrImage diretamente
                version: QrVersions.auto, // Versão do QR
                size: 200.0, // Tamanho do QR Code
              ),
            ],
          ],
        ),
      ),
    );
  }

  String? _generateQrData() {
    final nome = _nomeController.text.trim();
    final cpf = _cpfController.text.trim();

    if (nome.isNotEmpty && cpf.isNotEmpty) {
      return 'Nome: $nome, CPF: $cpf';
    }
    return null;
  }
}
