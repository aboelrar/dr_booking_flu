import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/image.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/image_bg.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/line.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/my_info_item.dart';
import 'package:flutter/material.dart';

class update_personal_info extends StatelessWidget {
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
                    margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * .3 / 4),
                    child: Card(
                      margin: EdgeInsets.only(right: 10.0,left: 10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1.5 / 4,
                        child: Column(
                          children: <Widget>[
                            my_info_item("محمود سعد","images/person.png"), //EDIT USER NAME
                            line(), //LINE
                            my_info_item("01141012485","images/phone.png"),
                            line(),
                            my_info_item("amraboelnaga10@g.com","images/email.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
