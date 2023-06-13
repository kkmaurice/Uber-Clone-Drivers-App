// ignore_for_file: use_build_context_synchronously

import 'package:drivers_app/authentication/signup_screen.dart';
import 'package:drivers_app/mainScreens/main_screen.dart';
import 'package:drivers_app/splashScreen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../widgets/progress_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateDriver() {
    if (emailController.text.isNotEmpty &&
        emailController.text.contains('@') &&
        passwordController.text.isNotEmpty) {
      // login driver
      loginDriver();
    } else {
      // show error message
      Fluttertoast.showToast(
          msg: 'Email and password are mandatory and email must be valid',
          backgroundColor: Colors.white,
          textColor: Colors.black);
    }
  }

  loginDriver() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) =>
            ProgressDialog(message: 'Logging In, Please wait...'));
    final UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text).catchError((error) {
          Navigator.pop(context);
          Fluttertoast.showToast(
          msg: error.toString(),
          backgroundColor: Colors.white,
          textColor: Colors.black);
        });
        

    if (userCredential != null) {
      currentFirebaseUser = userCredential.user;
      Fluttertoast.showToast(
          msg: 'Logged in successfully',
          backgroundColor: Colors.white,
          textColor: Colors.green);
          Navigator.push(context, MaterialPageRoute(builder: (context) => const MySplashScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/logo1.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Login as a Driver',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.grey),
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    validateDriver();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Login'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      child: const Text(
                        'Register Now',
                        style: TextStyle(color: Colors.yellow),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
