import 'package:flutter/material.dart';

AppBar MyAppBar() {
  return AppBar(
    leading: Image.asset('images/logo.png'),
    title: Title(color: Colors.lightBlue, child: Text('Hello')),
  );
}