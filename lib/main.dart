import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personality_app/extras/themes.dart';
import 'package:personality_app/pages/HomePage.dart';
import 'package:personality_app/pages/resultsPage.dart';
import 'package:personality_app/pages/static/chat.dart';
import 'package:personality_app/pages/static/loading.dart';
import 'package:personality_app/pages/static/output.dart';
import 'package:personality_app/pages/static/test.dart';
import 'package:personality_app/pages/testPage.dart';
//import 'package:personality_app/providers/authProvider.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personality Test',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
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
