import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emergency.dart';
import '/firstaid.dart';
import '/firstaid/sleep.dart';
import 'appbar.dart';
import 'bottombar.dart';
import 'firstaid/blood.dart';
import 'firstaid/breakbone.dart';
import 'menu.dart';
import 'theme.dart';

void main() {
  runApp(rescueApp());
}

class rescueApp extends StatelessWidget {
  const rescueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme(),
      routes: {
        '/menu' :(context) => Menu(),
        '/firstaid' :(context) => FirstAid(),
        '/breakbone' :(context) => BreakBone(),
        '/blood' :(context) => Blood(),
        '/sleep' :(context) => Sleep(),
        '/emergency' :(context) => Emergency(),
      },
      home: Menu(),
    );
  }
}