import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Básico',
      home: BasicLayout(),
    );
  }
}

class BasicLayout extends StatefulWidget {
  @override
  _BasicLayoutState createState() => _BasicLayoutState();
}

class _BasicLayoutState extends State<BasicLayout> {
  bool _isLiked = false;
  String _comment = '';

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  void _showCommentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar Comentário'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                _comment = value;
              });
            },
            decoration: InputDecoration(hintText: 'Digite seu comentário'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar o comentário
                print('Comentário salvo: $_comment');
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout Básico'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Exemplo de Layout Básico',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: _isLiked
                        ? Icon(Icons.favorite, color: Colors.blue)
                        : Icon(Icons.favorite_border),
                    onPressed: _toggleLike,
                  ),
                  SizedBox(width: 10.0),
                  IconButton(
                    icon: Icon(Icons.comment),
                    onPressed: _showCommentDialog,
                  ),
                  Text(
                    'Comentário: $_comment',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Image.network(
                'https://via.placeholder.com/150',
                width: 150.0,
                height: 150.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
