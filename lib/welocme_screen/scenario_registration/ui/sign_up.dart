import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/app_logo.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/text_field_widget.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/welcome_button.dart';
import 'package:flutter/material.dart';

class sign_up extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: ListView(
          children: <Widget>[
           Form(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: AutoSizeText(
                    "التسجيل!",
                    style: TextStyle(fontSize: 25.0,fontFamily: 'thesansbold'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: app_logo(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0,left: 50.0,right: 50.0),
                  child: Column(
                    children: <Widget>[
                      text_field_widget("الاسم",Icons.person,null),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: text_field_widget("كلمة السر",Icons.lock,null),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: text_field_widget("رقم الهاتف",Icons.phone,null),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:10.0),
                        child: text_field_widget("البريد الالكترونى",Icons.email,null),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:25.0),
                        child: welcome_button("تسجيل"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          ]
        )
      ),
    );
  }

}