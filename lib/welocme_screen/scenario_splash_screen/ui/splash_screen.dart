import 'dart:async';

import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/ui/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class splash_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return splash_state();
  }
}

class splash_state extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/anim.gif",),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {

    super.initState();
    get_data_fromlocal();

  }



  //CHECK IF TRUE OR FALSE TO LOGIN OR GO TO MAIN SCREEN
  get_data_fromlocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool status = prefs.getBool('status'); //GET BOOLEAN
    Timer(
        Duration(seconds: 7),
            () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              if(status == true)
                {
                  return search();
                }
              else{
                return login();
              }
            })));
  }

}
