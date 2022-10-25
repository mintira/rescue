import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appbar.dart';
import '../bottombar.dart';

class Sleep extends StatelessWidget {
  const Sleep({Key? key}) : super(key: key);

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'images/sleep.png',
                      width: MediaQuery.of(context).size.height * 0.25,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Column(
                        children: [
                          Center(
                              child: Text(
                            'เป็นลม',
                            style: GoogleFonts.kanit(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          )),
                          Text(
                              '     เริ่มจากการจัดท่าทางให้ผู้ป่วยนอนหงายราบและยกขาขึ้นอยู่เหนือระดับหัวใจ (ประมาณ 30 เซนติเมตร) เพื่อให้เลือดไหลเวียนไปเลี้ยงสมองง่ายขึ้น รวมทั้งปลดเข็มขัด, ปกคอเสื้อหรือเสื้อผ้าส่วนอื่น ๆ ที่รัดแน่น จากนั้นให้ติดต่อขอความช่วยเหลือจากหน่วยงานแพทย์ใกล้เคียงหรือหน่วยกู้ชีพ',
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