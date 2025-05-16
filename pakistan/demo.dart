import 'package:flutter/material.dart';

class DemoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('Pakistan Flag',style: TextStyle(
          fontSize:20,
          fontWeight: FontWeight.bold,
            color: Colors.yellow
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Image.asset(
          'assets/flag.jpg',
          width: 300,
          height: 200,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
