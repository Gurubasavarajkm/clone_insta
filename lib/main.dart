import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/sign_up_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    if (kIsWeb) {
      //Firebase initialization for web
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: 'AIzaSyD1YBd0fvJmfP3DdXVL158YuDhw58EyUx8',
          appId: '1:359581482140:web:ab254fa5af0968fc9ac159',
          messagingSenderId: '359581482140',
          projectId: 'insta-clone-6c5bd',
          storageBucket: 'insta-clone-6c5bd.appspot.com',
        ),
      );
    } else {
      //Firebase initialization for non-web platforms
      await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: 'AIzaSyA_wkc1DikxkaoG3S0uMcZL-H7odxRI8Es',
              appId: '1:359581482140:android:852d6e84ee0778719ac159',
              messagingSenderId: '359581482140',
              projectId: 'insta-clone-6c5bd',
              storageBucket: 'insta-clone-6c5bd.appspot.com'));
      await FirebaseAppCheck.instance.activate(
        androidProvider: AndroidProvider.debug,
      );
    }
  } catch (e) {
    debugPrint(e.toString());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark()
            .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
        home:
            const SignUpScreen() //const ResponsiveLayout(webScreenLayout:  WebScreen(), mobileScreenLayout:  MobileScreen(),
        // ),
        );
  }
}
