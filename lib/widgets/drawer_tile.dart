import 'package:flutter/material.dart';

ListTile drawerTile(Icon leadingIcon, String title) {
  return ListTile(
    leading: leadingIcon,
    title: Text(
      title
    ),
  );
}
