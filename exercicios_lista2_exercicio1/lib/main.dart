import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Layout Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Layout Example'),
        ),
        body: BasicLayout(),
      ),
    );
  }
}

class BasicLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Widget dentro do Container',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.thumb_up),
                SizedBox(width: 10.0),
                Text('Like'),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.comment),
                SizedBox(width: 10.0),
                Text('Comentário'),
              ],
            ),
            SizedBox(height: 20.0),
            Image.asset(
              'assets/flutter_logo.png',
              width: 100.0,
              height: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
