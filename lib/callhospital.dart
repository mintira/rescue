import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appbar.dart';
import '../bottombar.dart';

class CallHospital extends StatelessWidget {
  const CallHospital({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 40),
          child: ListView(
            children: [
              
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
