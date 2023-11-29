import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({super.key});

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  String username = '';
  @override
  void initState()
  {
    super.initState();
    getUsername();
  }

  void getUsername() async
  {
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser!.uid).get();

    setState(() {
      username = (snap.data() as Map<String, dynamic>)['username'];
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Web Screen"),),
      body:  Center(
        child: Text(username),
      ),
    );
  }
}