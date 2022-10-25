import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'appbar.dart';
import 'bottombar.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 40),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue[200],
                ),
                child: Column(children: [
                  Text(
                    'คุณต้องการแจ้งเหตุกับโรงพยาบาลใช่หรือไม่?',
                    style: GoogleFonts.kanit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: Text(
                              'โทรด่วน',
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[900],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                            child: Text(
                              'คลินิกใกล้ฉัน',
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/firstaid');
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 116, 255, 192),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 0, 141, 101),
                                    ),
                                    //padding: EdgeInsets.all(20),
                                    child: Image.asset(
                                      'images/plaster.png',
                                      width: 70,
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'วีธีปฐมพยาบาล',
                                style: GoogleFonts.kanit(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/emergency');
                        },
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromARGB(255, 152, 168, 255),
                                ),
                                padding: EdgeInsets.all(10),
                                child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromARGB(255, 152, 168, 255),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      'images/ambulance.png',
                                      width: 70,
                                    )),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'แจ้งเหตุกู้ภัย',
                                style: GoogleFonts.kanit(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Column(
                            children: [
                              Image.asset(
                                'images/hospital.png',
                                width: 90,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'คลินิกใกล้เคียง',
                                style: GoogleFonts.kanit(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 45,
                                backgroundColor:
                                    Color.fromARGB(255, 255, 192, 213),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'coming soon..',
                                style: GoogleFonts.kanit(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
