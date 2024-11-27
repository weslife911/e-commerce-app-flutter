import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/shared/widgets/widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();
  bool obscureTextPwd = false;
  bool obscureTextConfrimPwd = false;
  bool obscureText = false;

  void toggleObscurePwd() {
    setState(() {
      obscureTextPwd = !obscureTextPwd;
    });
  }

  void toggleObscureConfirmPwd() {
    setState(() {
      obscureTextConfrimPwd = !obscureTextConfrimPwd;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 12, right: 12, bottom: 10),
              child: textField("Enter Name", nameController, "John Doe", false),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: textField("Enter Email", emailController, "johndoe@gmail.com", false),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: textField("Enter Mobile", phoneController, "+237XXXXXXXXX", false),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: textField("Password", pwdController, onPressed: () => toggleObscurePwd(), "..............", field: "pwd", !obscureTextPwd),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: textField("Confirm Password", confirmPwdController, onPressed: () => toggleObscureConfirmPwd(), "..............", field: "pwd", !obscureTextConfrimPwd),
            ),
            Padding(
                padding: const EdgeInsets.all(12),
                child: button(Colors.blue, Colors.white, () {
                  pwdController.text == confirmPwdController.text
                      ? FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: pwdController.text).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text("Signed Up Successfully"),
                          ));
                        })
                      : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Passwords don't match"),
                        ));
                }, const Text("Sign Up")))
          ],
        ),
      ),
    );
  }
}
