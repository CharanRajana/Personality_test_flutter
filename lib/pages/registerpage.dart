import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personality_app/extras/helperfunctions.dart';
import 'package:personality_app/models/authRepository.dart';

import '../extras/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var _isloading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
      });
      await Authentication()
          .signUpWithEmail(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        context: context,
      )
          .then((value) async {
        if (value != true) {
          setState(() {
            showSnackBar(context: context, text: value);
            _isloading = false;
          });
        } else {
          await HelperFunctions.saveUserEmailInStatus(emailController.text);
          await HelperFunctions.saveUserNameInStatus(nameController.text);
          await HelperFunctions.saveUserLoggedInStatus(true);
          // ignore: use_build_context_synchronously
          Navigator.pushNamed(context, "/homepage");
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isloading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            body: SingleChildScrollView(
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
                          'Register to take the personality test!',
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
                            controller: nameController,
                            decoration: inputDecoration.copyWith(
                              labelText: 'username',
                              prefixIcon: const Icon(
                                Icons.person_2_outlined,
                              ),
                            ),
                          ),
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
                              register();
                            },
                            child: const Text(
                              'Register',
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
                              const Text("Already have an account?"),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () => Navigator.pop(context),
                                child: const Text(
                                  "Login Now",
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
