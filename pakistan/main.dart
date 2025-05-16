import 'package:flutter/material.dart';
import 'demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Flag Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('Home Screen',style:
          TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.yellow
          ),),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Show Pakistan Flag'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DemoScreen()),
            );
          },
        ),
      ),
    );
  }
}
