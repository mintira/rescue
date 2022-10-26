import 'dart:convert';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import '../appbar.dart';
import '../bottombar.dart';

class CallHospital extends StatefulWidget {
  CallHospital({Key? key}) : super(key: key);

  @override
  State<CallHospital> createState() => _CallHospitalState();
}

class _CallHospitalState extends State<CallHospital> {
  //Variable
  List<Hospital> hospital = []; //List of Hospital

  //get data from api
  Future getHospital() async {
    var url = Uri.parse(
        'https://rescue.relaxlikes.com/api/hospital/viewhospital.php');
    var response = await http.get(url);
    var data = json.decode(response.body);
    for (var i = 0; i < data.length; i++) {
      Hospital hospital = Hospital(
          data[i]['hospital_id'],
          data[i]['hospital_name'],
          data[i]['hospital_telphone'],
          data[i]['hospital_image']);
      this.hospital.add(hospital); //add to list of hospital
    }
    //print list of hospital
    return hospital; //return list of hospital
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 40),
          child: FutureBuilder(
            future: getHospital(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Lottie.asset('images/animation/loading.json',
                            height: 120, width: 120),
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
                return ListView.builder(
                  itemCount: hospital.length,
                  itemBuilder: (context, index) {
                    return HospitalCard(
                        hospital: hospital[index]); //return list of hospital
                  },
                );
              }
            },
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class Hospital {
  final String hospitalid;
  final String hospitalName;
  final String hospitalTel;
  final String hospitalImage;

  Hospital(
      this.hospitalid, this.hospitalName, this.hospitalTel, this.hospitalImage);
}

class HospitalCard extends StatefulWidget {
  final Hospital hospital;

  HospitalCard({Key? key, required this.hospital}) : super(key: key);

  @override
  State<HospitalCard> createState() => _HospitalCardState();
}

class _HospitalCardState extends State<HospitalCard> {



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.lightBlue[200],
        ),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 280,
                  height: 200,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'https://rescue.relaxlikes.com/images/hospital/${widget.hospital.hospitalImage}',
                        fit: BoxFit.cover,
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  '${widget.hospital.hospitalName}',
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  softWrap: false,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: (){
                // FlutterPhoneDirectCaller.callNumber('0908672636');
              //  launchUrl(Uri.parse('tel:${widget.hospital.hospitalTel}'));

              },
              child: Text(
                'โทรเลย',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.8, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
