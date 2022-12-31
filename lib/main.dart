import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personality_app/extras/helperfunctions.dart';
import 'package:personality_app/extras/themes.dart';
import 'package:personality_app/firebase_options.dart';
import 'package:personality_app/pages/HomePage.dart';
import 'package:personality_app/pages/loginpage.dart';
import 'package:personality_app/pages/registerpage.dart';
import 'package:personality_app/pages/resultsPage.dart';
import 'package:personality_app/pages/static/chat.dart';
import 'package:personality_app/pages/static/loading.dart';
import 'package:personality_app/pages/static/output.dart';
import 'package:personality_app/pages/static/entry.dart';
import 'package:personality_app/pages/testPage.dart';
//import 'package:personality_app/providers/authProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  bool _isSignedIn = false;
  @override
  void initState() {
    super.initState();
    getUserLoggedInState();
  }

  getUserLoggedInState() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personality Test',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: _isSignedIn ? '/homepage' : '/loginpage',
      routes: {
        '/loginpage': (context) => const LoginPage(),
        'registerpage': (context) => const RegisterPage(),
        '/homepage': (context) => const HomePage(),
        '/survey': (context) => const TestPage(),
        '/results': (context) => const ResultsPage(),
        '/loading': (context) => const Loading(),
        '/chat': (context) => const Chat(),
        '/test': (context) => const Test(),
        '/output': (context) => const Output(),
      },
    );
  }
}
