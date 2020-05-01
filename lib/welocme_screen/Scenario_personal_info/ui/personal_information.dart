import 'package:dr_booking_flu/check_internet_connection/check_connection_listner.dart';
import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/widget/bg_container.dart';
import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/widget/bottom_card.dart';
import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/widget/top_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class personal_information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    check_connection_listner(context); //CONNECTION LISTNER

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(

            height: MediaQuery.of(context).size.height,
          ),
          bg_container(),
          Positioned(
            top: MediaQuery.of(context).size.height * .8 / 5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                top_card(),
                Image.asset(
                  "images/link.png",
                  width: MediaQuery.of(context).size.width * .6 / 5,
                  height: MediaQuery.of(context).size.height * .6 / 10,
                  color: Colors.green,
                ),
                bottom_card()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
