import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/responsive/mobile_screen.dart';
import 'package:instagram_clone/responsive/responsive_layout.dart';
import 'package:instagram_clone/responsive/webScreen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark()
              .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
          home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return const ResponsiveLayout(
                      webScreenLayout: WebScreen(),
                      mobileScreenLayout: MobileScreen(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('${snapshot.error}'),
                    );
                  }
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }

                return const LoginScreen();
              })),
    );
  }
}
