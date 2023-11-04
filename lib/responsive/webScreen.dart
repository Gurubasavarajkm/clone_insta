import 'package:flutter/material.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebScreem"),
        elevation: 2,
      ),
      body: const Center(
        child: Text("This is Web Screen Page"),
      ),
    );
  }
}