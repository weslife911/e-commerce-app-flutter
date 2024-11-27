// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

TextField textField(String labelText, TextEditingController controller,
    String hintText, bool obscureText,
    {Function()? onPressed, String? field}) {
  return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(labelText),
          hintText: hintText,
          suffixIcon: obscureText && field == "pwd"
              ? IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.remove_red_eye),
                )
              : !obscureText && field == "pwd"
                  ? IconButton(
                      onPressed: onPressed,
                      icon: const Icon(Icons.remove_red_eye_outlined),
                    )
                  : null));
}

MaterialButton button(
    Color color, Color textColor, Function() onPressed, Widget child) {
  return MaterialButton(
    textColor: textColor,
    color: color,
    onPressed: onPressed,
    minWidth: double.infinity,
    height: 50,
    child: child,
  );
}

Container detailContainer(List<Widget> children) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(35)
    ),
    height: 50,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    ),
  );
}
