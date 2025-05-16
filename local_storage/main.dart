import 'package:flutter/material.dart';
import 'storage_screen.dart';

void main() {
  runApp(LocalStorageApp());
}

class LocalStorageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: StorageScreen(),
    );
  }
}
