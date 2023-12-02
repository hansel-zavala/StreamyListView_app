import 'package:flutter/material.dart';
import 'package:streamsylistview_app/widgets/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Aplicacion Stream y ListView'),
        ),
        body: const Center(
          child: Home(),
        ),
      ),
    );
  }
}