// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/screens/auth_pages.dart';
import 'package:shopping_app/widgets/drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  final String email;
  const MyDrawer({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade100,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(radius: 30, child: Icon(Icons.person)),
                Text(
                  email,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: drawerTile(Icon(Icons.shopping_cart), "Cart"),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthPage(),
                  ),
                  (route) => false);
            },
            child: GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AuthPage(),
                        ),
                        (route) => false);
                  });
                },
                child: drawerTile(Icon(Icons.logout), "Logout")),
          )
        ],
      ),
    );
  }
}
