import 'package:flutter/material.dart';
import 'package:flutter_application_3/screens/main_screens_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab4',
      home: MainScreensProvider(), 
    );
  }
}