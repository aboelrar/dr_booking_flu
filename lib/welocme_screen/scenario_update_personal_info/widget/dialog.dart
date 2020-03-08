import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/widget/bottom_card.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/ui/update_personal_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'line.dart';

class dialog {
  void dialog_method(
      BuildContext context, String value, String title, int flag) {
    final _controller = TextEditingController();
    final text = value;
    _controller.value = _controller.value.copyWith(
      text: text,
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: MediaQuery.of(context).size.height * 3 / 10,
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 14.0, fontFamily: 'thesansbold'),
                  ),
                  line(),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 30.0, left: 30.0, top: 20.0),
                    child: TextField(
                      controller: _controller,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        FlatButton(
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          splashColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: () {
                            check_dialog(flag, context, _controller);
                          },
                          child: Text(
                            'تعديل',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'thesansbold'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 30.0),
                            child: Text(
                              'الغاء',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: 'thesansbold'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String name, email, phone; //DEFINE VARS
  //GET DATA FROM LOCAL
  void get_data_fromlocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.get('user_name'); //GET NAME
    email = prefs.get('user_email'); //GET EMAIL
    phone = prefs.get('user_phone'); //GET PHONE
  }

  check_dialog(
      int flag, BuildContext context, TextEditingController controller) {
    get_data_fromlocal(); //CALL METHOD THAT BACK FROM LOCAL DATA

    if (flag == 1) //IF EDIT ON NAME WITH FLAG ONE
    {
      bottom_card.name = controller.text;  //SET TEXT NAME CONTROLLER THAT EDITED
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return update_personal_info(
            controller.text, email, phone); //IF EDIT ON NAME WITH FLAG ONE
      }));
    } else if (flag == 2) //IF EDIT ON PHONE WITH FLAG TWO
    {
      bottom_card.phone = controller.text;  //SET TEXT PHONE CONTROLLER THAT EDITED

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return update_personal_info(
            name, email , controller.text); //IF EDIT ON PHONE WITH FLAG TWO
      }));
    } else if (flag == 3) //IF EDIT ON Email WITH FLAG THRER
    {

      bottom_card.email = controller.text;  //SET TEXT EMAIL CONTROLLER THAT EDITED

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return update_personal_info(
            name, controller.text, phone ); //IF EDIT ON Email WITH FLAG THRER
      }));
    }
  }
}
