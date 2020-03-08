import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_my_appoienments/ui/appoienments.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/ui/login.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/ui/update_personal_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/personal_information.dart';

// ignore: camel_case_types
class bottom_card extends StatelessWidget {
  static String name, email, phone;

  //GET DATA FROM LOCAL
  void get_data_fromlocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.get('user_name'); //GET NAME
    email = prefs.get('user_email'); //GET EMAIL
    phone = prefs.get('user_phone'); //GET PHONE
  }

  @override
  Widget build(BuildContext context) {

    get_data_fromlocal(); //GET DATA FROM LOCAL

    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 1.8 / 5,
        ),
        Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Container(
              padding: EdgeInsets.only(right: 15.0, left: 15.0, top: 20.0),
              height: MediaQuery.of(context).size.height * 1.6 / 5,
              width: MediaQuery.of(context).size.width * 3.5 / 5,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return update_personal_info(name, email,
                            phone); //GO TO EDIT MY PERSONAL INFORMATION
                      }));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "images/person.png",
                              width: 30,
                              height: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: AutoSizeText(
                                "البيانات الشخصية",
                                style: TextStyle(
                                    fontSize: 16.0, fontFamily: 'thesansbold'),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          "images/nxt_page.png",
                          width: 15,
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff33d3d3d3),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return aappoienments(); //GO TO MY FAVOURITE
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/calendar.png",
                                width: 30,
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: AutoSizeText(
                                  "حجوزاتى",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'thesansbold'),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "images/nxt_page.png",
                            width: 15,
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff33d3d3d3),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return doctor_list(null, 2); //GO TO MY FAVOURITE
                      }));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                "images/favourites.png",
                                width: 30,
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 15.0,
                                ),
                                child: AutoSizeText(
                                  "مفضلتى",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'thesansbold'),
                                ),
                              ),
                            ],
                          ),
                          Image.asset(
                            "images/nxt_page.png",
                            width: 15,
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 2,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xff33d3d3d3),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 1.39 / 5,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(right: 120.0, left: 120.0),
            child: FlatButton(
              color: Colors.white,
              textColor: Colors.white,
              disabledColor: Colors.white,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              child: Text(
                "تسجيل الخروج",
                style: TextStyle(
                    fontSize: 13.0,
                    fontFamily: 'thesansbold',
                    color: Colors.black),
              ),
              onPressed: () {
                //SIGN OUT
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return login(); //GO TO LOGIN PAGE
                }));
              },
            ),
          ),
        )
      ],
    );
  }
}
