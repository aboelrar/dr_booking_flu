import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/widget/bottom_navigation.dart';
import 'package:dr_booking_flu/doctors_pages/widget/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/choose.png",
                  width: MediaQuery.of(context).size.width * 3 / 3,
                  height: MediaQuery.of(context).size.height * 4 / 10,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 2 / 10,
                child: AutoSizeText(
                  "ابحث الان عن الطبيب المناسب ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'thesansbold'),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1 / 10,
                child: search_text_field(),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 1 / 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AutoSizeText(
                      'يتم الفصل بين الاعراض ب , مثال بوتكس , صداع , برد',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontFamily: 'thesansbold')),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
        bottomNavigationBar : bottom_navigation(),
    );
  }
}
