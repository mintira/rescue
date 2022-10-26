import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rescueapp/emergency.dart';
import 'package:http/http.dart' as http;
import '../appbar.dart';
import '../bottombar.dart';

class EmerCheck extends StatefulWidget {
  final Symptomsid;
  final Symptomsname;
  final Symptomsimage;
  final Locationid;
  final Locationname;

  const EmerCheck(
      {Key? key,
      required this.Symptomsid,
      required this.Symptomsname,
      required this.Symptomsimage,
      required this.Locationid,
      required this.Locationname})
      : super(key: key);

  @override
  State<EmerCheck> createState() => _EmerCheckState();
}

class _EmerCheckState extends State<EmerCheck> {
  //Variable

  Future AddEmergency() async {
    var url = Uri.parse(
        'https://rescue.relaxlikes.com/api/emergency/insert_emergency.php');
    var response = await http.post(url, body: {
      'symptom_id': widget.Symptomsid,
      'location_id': widget.Locationid,
    });
    var data = json.decode(response.body);
    
    if (data == 'Success') {
      Fluttertoast.showToast(
          msg: "แจ้งเหตุสำเร็จ กรุณารอการตอบรับจากเจ้าหน้าที่",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pushNamed(context, '/emerwait');
    } else {
      Fluttertoast.showToast(
          msg: "แจ้งเหตุไม่สำเร็จ กรุณาลองใหม่อีกครั้ง",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 40),
          child: ListView(
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.lightBlue[200],
                ),
                padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.content_paste_search,
                          color: Colors.blue[900],
                          size: 80,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'กรุณาตรวจสอบข้อมูล\nของท่านให้ถูกต้อง',
                          style: GoogleFonts.kanit(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/emerstart');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Icon(
                            //   Icons.mood_bad,
                            //   color: Colors.red,
                            //   size: 100,
                            // ),
                            Image.network(
                              'https://rescue.relaxlikes.com/images/symptoms/${widget.Symptomsimage}',
                              width: 50,
                              height: 50,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '${widget.Symptomsname}',
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
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/emerstart');
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.red,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    '${widget.Locationname}',
                                    softWrap: false,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.kanit(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width,
                            //   height: MediaQuery.of(context).size.height * 0.2,
                            //   margin: EdgeInsets.only(bottom: 20),
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30),
                            //     color: Colors.lightBlue[200],
                            //   ),
                            //   child: Text(
                            //     widget.Locationname,
                            //     style: GoogleFonts.kanit(
                            //       fontSize: 18,
                            //       fontWeight: FontWeight.w500,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
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
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  AddEmergency();
                },
                child: Text(
                  'ยืนยัน',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width, 60),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'ย้อนกลับ',
                  style: GoogleFonts.kanit(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(MediaQuery.of(context).size.width, 60),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
