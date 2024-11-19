// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, await_only_futures

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_app/screens/auth_pages.dart';
import 'package:shopping_app/widgets/widgets.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController resetpwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
            backgroundColor: Colors.grey.shade100,
            title: Text("Reset Password")),
        body: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 10),
              child: TextField(
                  controller: resetpwd,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Reset Password"),
                      hintText: "Enter Email Address")),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: button(Colors.blue, Colors.white, () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: resetpwd.text)
                    .then((value) async {
                  await ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.green,
                      content: Text(
                        "Email sent successfully to ${resetpwd.text}"
                      ),
                    )
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthPage(),
                    )
                  );
                });
              }, Text("Reset Password")),
            )
          ],
        ));
  }
}
