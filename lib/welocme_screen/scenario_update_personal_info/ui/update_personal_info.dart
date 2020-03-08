import 'dart:math';

import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/widget/bottom_card.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/image.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/image_bg.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/line.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/my_info_item.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/save_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class update_personal_info extends StatelessWidget {

   String name,email,phone;

   update_personal_info(this.name, this.email, this.phone);



   @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          image_bg(),
          Positioned(
              top: MediaQuery.of(context).size.height * 1.15 / 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: image(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .3 / 4),
                    child: Card(
                      margin: EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1.1 / 4,
                        child: Column(
                          children: <Widget>[
                            my_info_item(bottom_card.name, "images/person.png",
                                'تعديل الاسم',1), //EDIT USER NAME
                            line(), //LINE
                            my_info_item(bottom_card.phone, "images/phone.png",
                                'تعديل الهاتف',2),
                            line(),
                            my_info_item(bottom_card.email,
                                "images/email.png", 'تعديل البريد الالكترونى',3),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          Positioned(
            top: MediaQuery.of(context).size.height * 3 / 4,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width * 1 / 3,
                  left: MediaQuery.of(context).size.width * 1 / 3),
              child: save_button(),
            ),
          )
        ],
      ),
    );
  }

}
