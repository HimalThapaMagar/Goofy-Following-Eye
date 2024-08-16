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
        actions: [
          Row(
            children: [
              Text('Made by Goofy'),
              GoofyEyeScreen(),
              Text("eyes"),
            ],
          )
        ],
      ),
      // body: const GoofyEyeScreen(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome to Goofy Eye',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}