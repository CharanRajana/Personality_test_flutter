// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personality_app/extras/helperfunctions.dart';
import 'package:personality_app/models/authRepository.dart';
import 'package:personality_app/models/databaseRepository.dart';
import 'package:personality_app/pages/registerpage.dart';

import '../extras/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _isloading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    if (_formKey.currentState!.validate()) {
      await Authentication()
          .signInWithEmail(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      )
          .then((value) async {
        if (value != true) {
          showSnackBar(context: context, text: value);
        } else {
          QuerySnapshot snapshot =
              await DatabaseService(uid: Authentication().auth.currentUser!.uid)
                  .gettingUserData(emailController.text);
          await HelperFunctions.saveUserEmailInStatus(emailController.text);
          await HelperFunctions.saveUserNameInStatus(snapshot.docs[0]['name']);
          await HelperFunctions.saveUserLoggedInStatus(true);
          Navigator.pushNamed(context, "/homepage");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 50,
                ),
                child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Personality\n    Test',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Login to take the personality test!',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset(
                          'assets/images/survey.svg',
                          width: double.infinity,
                          height: 200,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          child: TextFormField(
                            validator: (value) => value!.contains('@')
                                ? null
                                : 'Enter a valid email',
                            controller: emailController,
                            decoration: inputDecoration.copyWith(
                              labelText: 'email',
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            validator: (value) => value!.length < 6
                                ? 'Password is too short'
                                : null,
                            controller: passwordController,
                            obscureText: true,
                            decoration: inputDecoration.copyWith(
                              labelText: 'password',
                              prefixIcon: const Icon(
                                Icons.lock_outlined,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 20,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Don't have an account?"),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const RegisterPage(),
                                  ),
                                ),
                                child: const Text(
                                  "Register Now",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
