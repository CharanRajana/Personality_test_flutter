import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personality_app/pages/resultsPage.dart';
import 'package:personality_app/providers/answerProvider.dart';

class Output extends ConsumerWidget {
  const Output({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                ref.read(answerProvider) != ''
                    ? 'click here \nto view results'.toUpperCase()
                    : 'No results yet!\n\ntake the test \nto get some insights'
                        .toUpperCase(),
                style: const TextStyle(
                  fontSize: 40,
                  letterSpacing: 5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ref.read(answerProvider) != ''
                ? FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResultsPage()));
                    },
                    label: const Text(
                      'Results',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
