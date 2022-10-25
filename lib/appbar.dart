import 'package:flutter/material.dart';

AppBar MyAppBar() {
  return AppBar(
    leading: Image.asset('images/logo.png'),
    leadingWidth: 80,
    title: Text('Rescue of University',
    style: TextStyle(
      color: Color.fromARGB(255, 0, 127, 230),
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    ),
    toolbarHeight: 80,
  );
}