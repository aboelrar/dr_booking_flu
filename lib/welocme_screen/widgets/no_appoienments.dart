import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class no_appoienments_dialog {
  no_appoienments_dialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, anim1, anim2) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 210.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/sad.png',
                    width: 55,
                    height: 55.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:15.0),
                    child: AutoSizeText(
                      'ناسف لكم !',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'thesansbold'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:7.0),
                    child: Text(
                      'لا توجد مواعيد متاحه لدى هذا الطبيب ...',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'thesansbold'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: FlatButton(
                      color: Colors.pink,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      splashColor: Colors.blueAccent,
                      padding: EdgeInsets.only(right: 30.0, left: 30.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
                      onPressed: () {
                        Navigator.pop(context); //CANCEL DIALOG
                      },
                      child: AutoSizeText(
                        'اغلاق',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
          Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },);
  }
}
