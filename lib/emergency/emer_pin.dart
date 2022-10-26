import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../appbar.dart';
import '../bottombar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';


class EmerPin extends StatefulWidget {
  EmerPin({Key? key}) : super(key: key);

  @override
  State<EmerPin> createState() => _EmerPinState();
}

class _EmerPinState extends State<EmerPin> {
  //Variable
  List location = [];
  String? selectedItem;

//get data from api
  Future getlocation() async {
    var url = Uri.parse('https://rescue.relaxlikes.com/api/location/viewlocation.php');
    var response = await http.get(url);
    var data = json.decode(response.body);
    setState(() {
      location = data;
    });
    print(location.toString());
    return location;
  }


  //init state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
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
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 80,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'กรุณาเลือกที่อยู่\nของท่านในปัจจุบัน',
                            style: GoogleFonts.kanit(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    LocaDropdown(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/emercheck');
                },
                child: Text(
                  'ถัดไป',
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
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class LocaDropdown extends StatefulWidget {
  const LocaDropdown({Key? key}) : super(key: key);

  @override
  State<LocaDropdown> createState() => _LocaDropdownState();
}

class _LocaDropdownState extends State<LocaDropdown> {
  final List<String> items = [
    'อาคารตัวยู',
    'คณะวิทยาศาสตร์',
    'อาคารศูนย์การเรียนรู้',
    'หอพัก',
  ];
String? selectedValue;


  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
        child: DropdownButton2(
          hint: Text(
            'เลือกจุดรับ',
            style: GoogleFonts.kanit(
                   fontSize: 18,
              color: Theme
                      .of(context)
                      .hintColor,
            ),
          ),
          items: items
                  .map((item) =>
                  DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                      ),
                    ),
                  ))
                  .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonHeight: 70,
          buttonWidth: MediaQuery.of(context).size.width*0.8,
          itemHeight: 70,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),
          buttonPadding: EdgeInsets.only(left: 14, right: 14),
        ),
      );
  }
}
