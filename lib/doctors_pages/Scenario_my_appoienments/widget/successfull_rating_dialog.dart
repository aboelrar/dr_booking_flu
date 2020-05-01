import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_welcome_tour/ui/welcome_tour.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class successfull_rating_dialog {
  success_dialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 180.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/tick.png',
                    width: 55,
                    height: 55.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'تم تقييم الطبيب بنجاح ...',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontFamily: 'thesansbold'),
                    ),
                  ),

                ],
              ),
            ),
          );
        });

    go_to_main_page(context); //CALL METHOD THAT WILL GO TO MAIN PAGE SEARCH
  }

  bool status;


  go_to_main_page(BuildContext context) async {
    await new Future.delayed(const Duration(seconds: 2));

    //DELETE ALL PATHS AND GO NEXT PAGE
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return search();  //GO TO SEARCH IF STATUS EQUAL TRUE

      }),
    );
  }
}
