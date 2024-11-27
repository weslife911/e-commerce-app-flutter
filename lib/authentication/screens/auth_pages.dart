import 'package:flutter/material.dart';
import 'package:shopping_app/authentication/screens/login_screen.dart';
import 'package:shopping_app/authentication/screens/register_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Log In"),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [LoginScreen(), RegisterScreen()],
      ),
    );
  }
}
