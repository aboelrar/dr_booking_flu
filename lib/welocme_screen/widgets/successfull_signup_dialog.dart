import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_welcome_tour/ui/welcome_tour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class successfull_signup_dialog {
  success_dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 190.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/suceess_login.png',
                    width: 55,
                    height: 55.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: AutoSizeText(
                      'شكرا لك !',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'thesansbold'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 3.0, right: 10.0, left: 10.0),
                    child: AutoSizeText(
                      'لقد تم التسجيل فى دكتور بوكينج بنجاح ...',
                      style:
                          TextStyle(fontSize: 16.0, fontFamily: 'thesansbold'),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        });


    get_data_fromlocal(); //METHOD TO CHECK IF STATUS TRUE OR FALSE TO KNOW GO TO WELCOME TOUR OR MAIN SCREEN
    go_to_main_page(context); //CALL METHOD THAT WILL GO TO MAIN PAGE
  }

  bool status;

  //CHECK IF TRUE OR FALSE TO LOGIN OR GO TO MAIN SCREEN
  get_data_fromlocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    status = prefs.getBool('status_welcome_tour'); //GET BOOLEAN
  }

  go_to_main_page(BuildContext context) async {
    await new Future.delayed(const Duration(seconds: 1));

    //DELETE ALL PATHS AND GO NEXT PAGE
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        if (status == true) {
          return search();  //GO TO SEARCH IF STATUS EQUAL TRUE
        } else {
          return welcome_tour();  //GO TO WELCOME TOUR IF NOT EQUAL TRUE
        }
      }),
    );
  }
}