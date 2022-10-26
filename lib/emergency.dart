import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import '../appbar.dart';
import '../bottombar.dart';
import 'emergency/emer_start.dart';

class Emergency extends StatefulWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  State<Emergency> createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  String? selectedItem;

  //List of Emergency
  List<Symptoms> symptom = [];

  Future getSymptoms() async {
    var url =
        Uri.parse('https://rescue.relaxlikes.com/api/symptom/viewsymptom.php');
    var response = await http.get(url);
    var data = json.decode(response.body);
    for (var i = 0; i < data.length; i++) {
      Symptoms symptoms = Symptoms(data[i]['symptoms_id'],
          data[i]['symptoms_name'], data[i]['symptoms_image']);
      this.symptom.add(symptoms); //add to list of symptoms
    }
    //print list of symptoms
    return symptom; //return list of symptoms
  }

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
              Expanded(
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.lightBlue[200],
                  ),
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ElevatedButton(
                        //   onPressed: () {
                        //     Navigator.pushNamed(context, '/emerstart');
                        //   },
                        //   child: Padding(
                        //     padding: EdgeInsets.all(10),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         Icon(
                        //           Icons.mood_bad,
                        //           color: Colors.red,
                        //           size: 100,
                        //         ),
                        //         Text(
                        //           'บาดเจ็บรุนแรง',
                        //           style: GoogleFonts.kanit(
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w500,
                        //             color: Colors.black,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        //   style: ElevatedButton.styleFrom(
                        //     primary: Colors.white,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(30),
                        //     ),
                        //   ),
                        // ),
                        FutureBuilder(
                          future: getSymptoms(),
                          builder: (context, snapshot) {
                            if (snapshot.data == null) {
                              return Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Lottie.asset(
                                          'images/animation/loading.json',
                                          height: 120,
                                          width: 120),
                                    ),
                                    Text(
                                      'กำลังโหลดข้อมูล...',
                                      style: GoogleFonts.kanit(
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: ListView.builder(
                                  itemCount: symptom.length,
                                  itemBuilder: (context, index) {
                                    return SymptomsCard(
                                        symptoms: symptom[index]);
                                  },
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
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

class Symptoms {
  String? symptomid;
  String? symptomname;
  String? symptomsimage;

  Symptoms(this.symptomid, this.symptomname, this.symptomsimage);
}

class SymptomsCard extends StatefulWidget {
  final Symptoms symptoms;

  SymptomsCard({Key? key, required this.symptoms}) : super(key: key);

  @override
  State<SymptomsCard> createState() => _SymptomsCardState();
}

class _SymptomsCardState extends State<SymptomsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/emerstart');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return EmerStart(
              Symptomsid: widget.symptoms.symptomid,
              Symptomsname: widget.symptoms.symptomname,
              Symptomsimage: widget.symptoms.symptomsimage,
            );
          }));

          print(widget.symptoms.symptomid);
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
                'https://rescue.relaxlikes.com/images/symptoms/${widget.symptoms.symptomsimage}',
                width: 100,
                height: 100,
              ),
              Text(
                '${widget.symptoms.symptomname}',
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
    );
  }
}
