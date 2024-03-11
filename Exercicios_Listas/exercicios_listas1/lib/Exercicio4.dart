import 'package:flutter/material.dart';

void main() {
  runApp(MyApp4());
}

class MyApp4 extends StatelessWidget {
  final List<String> _tabs = ['Home', 'Profile', 'Settings'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultTabController(
        length: _tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Custom Navigation Bar'),
            bottom: TabBar(
              tabs: _tabs.map((String tab) {
                return Tab(
                  text: tab,
                  icon: Icon(Icons.dashboard),
                );
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: _tabs.map((String tab) {
              return Center(
                child: Text('$tab Content'),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
