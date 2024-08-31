import 'package:flutter/material.dart';

class user_WelcomePage extends StatelessWidget {
  const user_WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
      body: const Center(
        child: Text(
          'USER',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
