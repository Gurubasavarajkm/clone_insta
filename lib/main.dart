import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/Login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb)
  {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyALMF42ygvAA-tXkInFhCrsHkFPRHiSgZQ',
         appId: '1:937418993801:web:239229dfdfb4fa82bd5658', 
         messagingSenderId: '937418993801', 
         projectId: 'feedcom-b694b',
         storageBucket: 'feedcom-b694b.appspot.com')
    );
  }
  else{
      await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: const LoginScreen(),//const ResponsiveLayout(webScreenLayout:  WebScreen(), mobileScreenLayout:  MobileScreen(),
      //),
    );
  }
}