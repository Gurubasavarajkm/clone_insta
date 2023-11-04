import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Mobile Screen"),),
      body: const Center(
        child: Text("This is Mobile Screen"),
      ),
    );
  }
}