import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Page'),
      ),
      body: const Center(
        child: Text('This is the Start Page'),
      ),
    );
  }
}
