import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../appbar.dart';
import '../bottombar.dart';

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

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
                    'แจ้งเหตุ',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [  
                            Icon(Icons.mood_bad,color: Colors.red,size: 100,),  
                            Text(
                              'บาดเจ็บรุนแรง',
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
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
                        
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.sentiment_dissatisfied,color: Colors.amber[700],size: 100,),
                            Text(
                              'บาดเจ็บปานกลาง',
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.sentiment_dissatisfied,color: Colors.lime,size: 100,),
                            Text(
                              'บาดเจ็บเล็กน้อย',
                              style: GoogleFonts.kanit(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    )
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
