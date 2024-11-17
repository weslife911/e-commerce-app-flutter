// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shopping_app/screens/reset_pwd_screen.dart';
import 'package:shopping_app/widgets/widgets.dart';
import "home_page.dart";
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  bool obscureText = false;

  void toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 10),
              child: textField(
                  "Email", emailController, "Email", field: "email", false),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: textField(
                  "Password",
                  pwdController,
                  onPressed: () => toggleObscure(),
                  "Password",
                  field: "pwd",
                  !obscureText),
            ),
            Padding(
                padding: EdgeInsets.all(12),
                child: button(Colors.blue, Colors.white, () {
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailController.text,
                      password: pwdController.text).then((value) {
                        Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(
                                email: emailController.text,
                              )),
                      (route) => false);
                      });
                  
                }, Text("Log In"))),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPasswordScreen(),
                        )
                      );
                    },
                    child: Text(
                      "Forgotten Password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue
                      ),
                    ),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
