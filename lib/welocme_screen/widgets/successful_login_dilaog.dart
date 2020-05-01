import 'package:dr_booking_flu/welocme_screen/widgets/animation_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class successful_login_dilog {

  void show_dialog (BuildContext context)
  {
    showGeneralDialog(context: context,
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, anim1, anim2)
        {
      return Dialog(
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 150,
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              animation_widget(50.0,"animations/success.json",50.0)
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
  }

}