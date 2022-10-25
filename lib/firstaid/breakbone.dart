import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../appbar.dart';
import '../bottombar.dart';

class BreakBone extends StatelessWidget {
  const BreakBone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 40),
          child: Column(
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
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue[200],
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/brokearm.png',
                      width: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            'แขนหรือขาหัก',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )),
                          Text(
                              '     ประคบน้ำแข็ง หรือยกแขน / ขาขึ้นเหนือหัวใจ หากผู้ป่วยมีแผลเปิด ให้ใช้ผ้าพันแผลปลอดเชื้อพันไว้และรีบเข้ารับการรักษาจากแพทย์ทันที',
                              style: GoogleFonts.kanit(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ))
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
