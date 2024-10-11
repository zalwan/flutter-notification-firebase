import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          'Notification Firebase',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const Center(
        child: Text('Testing Notification Firebase'),
      ),
    );
  }
}
