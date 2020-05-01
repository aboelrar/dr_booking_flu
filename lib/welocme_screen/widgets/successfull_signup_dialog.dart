import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_welcome_tour/ui/welcome_tour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class successfull_signup_dialog {
  success_dialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, anim1, anim2){
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
        },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
          Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },);


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
    await new Future.delayed(const Duration(milliseconds: 1200));

    var route_to;
    if (status == true) {
      route_to =  search();  //GO TO SEARCH IF STATUS EQUAL TRUE
    } else {
      route_to =  welcome_tour();  //GO TO WELCOME TOUR IF NOT EQUAL TRUE
    }

    //DELETE ALL PATHS AND GO NEXT PAGE
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    route_to), (Route<dynamic> route) => false);
  }
}
