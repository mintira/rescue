import 'package:flutter/material.dart';
import 'package:rescueapp/emergency/emer_check.dart';
import 'package:rescueapp/emergency/emer_pin.dart';
import 'package:rescueapp/emergency/emer_wait.dart';
import '/emergency/emer_start.dart';
import 'splashscreen.dart';
import 'emergency.dart';
import '/firstaid.dart';
import '/firstaid/sleep.dart';
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
      initialRoute: '/splashscreen',
      home: Menu(),
      routes: {
        '/splashscreen': (context) => Splashscreen(),
        '/menu' :(context) => Menu(),
        '/firstaid' :(context) => FirstAid(),
        '/breakbone' :(context) => BreakBone(),
        '/blood' :(context) => Blood(),
        '/sleep' :(context) => Sleep(),
        '/emergency' :(context) => Emergency(),
        '/emerstart' :(context) => EmerStart(),
        '/emerpin' :(context) => EmerPin(),
        '/emercheck' :(context) => EmerCheck(),
        '/emerwait' :(context) => EmerWait(),
      },
    );
  }
}