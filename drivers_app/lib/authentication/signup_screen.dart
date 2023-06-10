import 'package:drivers_app/widgets/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  validateForm() {
    if (nameTextEditingController.text.length < 3) {
      Fluttertoast.showToast(
          msg: 'Name must be at least 3 characters long',
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else if (!emailTextEditingController.text.contains('@')) {
      Fluttertoast.showToast(
          msg: 'Email address is not valid',
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else if (phoneTextEditingController.text.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Phone number is mandatory',
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else if (passwordTextEditingController.text.length < 6) {
      Fluttertoast.showToast(
          msg: 'Password must be at least 6 characters long',
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) =>
              ProgressDialog(message: 'Registering, Please wait...'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                'Register as a Driver',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: nameTextEditingController,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Name',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
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
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  hintText: 'Phone',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
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
                    validateForm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
