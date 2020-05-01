// ignore: camel_case_types

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class check_connection_dialog {
  dialog(BuildContext context, var color, String connection_type,bool status) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Label",
      barrierDismissible: false,
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (context, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              child:WillPopScope(
                // ignore: missing_return
                onWillPop: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  color: color,
                  child: Center(
                    child: (AutoSizeText(
                      connection_type,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'thesansbold'),
                    )),
                  ),
                ),
              ),
            ));
      },
    );
    close_dialog(context,connection_type,status);  //CLOSE DIALOG
  }

  close_dialog(BuildContext context,String text,bool status) async {
    await new Future.delayed(const Duration(milliseconds: 3000));

    if (text == "متصل بالانترنت") {
//      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
      Navigator.pop(context);

    }
    else if(text == 'لايوجد اتصال بالانترنت !')
      {
        if(status == true)
          {
            Navigator.pop(context);
          }
      }

  }
}
