import 'package:flutter/material.dart';

class WidgetsExamplePage extends StatelessWidget {
  const WidgetsExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
          leading: Icon(Icons.home, size: 30),
          centerTitle: true,
          backgroundColor: Colors.blue[200],
          title: const Text("Widgets Eamples")),
      body: const Placeholder(),
    );
  }
}
