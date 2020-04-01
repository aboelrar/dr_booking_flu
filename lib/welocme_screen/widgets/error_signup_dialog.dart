import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class error_signup_dialog {
  error_dialog(BuildContext context,String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                      'خطا ما!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontFamily: 'thesansbold'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:7.0),
                    child: Text(
                      message,
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
                        'حاول مجددا',
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
