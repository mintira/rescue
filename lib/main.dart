import 'package:flutter/material.dart';
import 'appbar.dart';
import 'theme.dart';

class rescueApp extends StatelessWidget {
  const rescueApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme(),
      home: Scaffold(
        appBar: MyAppBar(),
        body: Container(

        ),
      ),
    );
  }
}
