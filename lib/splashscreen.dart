import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  //delay 3 seconds to menu
  Future delay() async {
    await Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/menu');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    delay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  height: 100,
                ),
                Lottie.asset('images/animation/medicalloading.json',
                    height: 120, width: 120),
                Text(
                  'กำลังเริ่มต้น....',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
