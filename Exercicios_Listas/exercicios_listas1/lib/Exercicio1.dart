import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: (Scaffold(
            appBar: AppBar(
              title: Text("3 Container"),
            ),
            body: Column(
              children: [
                Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                    child: Center(
                      child: Text("Container 1"),
                    )),
                Container(
                  color: Colors.blue,
                  width: 150,
                  height: 150,
                ),
                Container(
                  color: Colors.green,
                  width: 200,
                  height: 200,
                )
              ],
            ))));
  }
}
