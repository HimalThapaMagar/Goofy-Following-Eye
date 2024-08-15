import 'package:flutter/material.dart';
import 'package:goofy_eyes/screens/goofy_eye_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goofy Eye'),
      ),
      body: const GoofyEyeScreen(),
    );
  }
}