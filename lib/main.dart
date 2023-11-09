// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/sign_up_screen.dart';
import 'package:instagram_clone/utils/colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (kIsWeb) {
      // Firebase initialization for web
      // await Firebase.initializeApp(
      //   options: const FirebaseOptions(
      //     apiKey: 'Your-API-Key',
      //     appId: 'Your-App-ID',
      //     messagingSenderId: 'Your-Messaging-Sender-ID',
      //     projectId: 'Your-Project-ID',
      //     storageBucket: 'Your-Storage-Bucket',
      //   ),
      // );
    } else {
      // Firebase initialization for non-web platforms
    //  await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    //  );
    }
  } catch (e) {
    debugPrint(e.toString());
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
      home: const SignUpScreen()//const ResponsiveLayout(webScreenLayout:  WebScreen(), mobileScreenLayout:  MobileScreen(),
      // ),
    );
  }
}