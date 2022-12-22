import 'package:flutter/material.dart';
import 'package:personality_app/pages/static/chat.dart';
import 'package:personality_app/pages/static/output.dart';
import 'package:personality_app/pages/static/test.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final pages = [
    const Test(),
    const Output(),
    const Chat(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Personality test'.toUpperCase(),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
      body: pages.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: (value) => setState(() {
          selectedIndex = value;
        }),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist_outlined),
            label: 'Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.output_rounded),
            label: 'Result',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
        ],
      ),
    );
  }
}
