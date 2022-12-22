import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Center(
              child: Text(
                'Connect\nwith\nLike-minded\nPeople'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          FloatingActionButton.extended(
            onPressed: () {
              Navigator.pushNamed(context, '/loading');
            },
            label: const Text(
              'Chat',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
