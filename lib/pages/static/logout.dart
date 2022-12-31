import 'package:flutter/material.dart';
import 'package:personality_app/models/authRepository.dart';

class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text(
          'Log Out',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        onPressed: () {
          Authentication().signOut();
          Navigator.popAndPushNamed(context, '/loginpage');
        },
      ),
    );
  }
}
