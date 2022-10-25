import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescueapp/appbar.dart';
import 'package:rescueapp/bottombar.dart';

class FirstAid extends StatelessWidget {
  const FirstAid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'ปฐมพยาบาล',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/breakbone');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('images/brokearm.png',
                        width: MediaQuery.of(context).size.width * 0.5),
                    Text(
                      'กระดูกหัก',
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sleep');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'เป็นลม',
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Image.asset('images/sleep.png',
                        width: MediaQuery.of(context).size.width * 0.5),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/blood');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('images/blood.png',
                        width: MediaQuery.of(context).size.width * 0.5),
                    Text(
                      'เลือดออก',
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
