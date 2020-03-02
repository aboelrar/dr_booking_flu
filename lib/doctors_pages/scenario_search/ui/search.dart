import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/app_widget/skip.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:dr_booking_flu/doctors_pages/widget/bottom_navigation.dart';
import 'package:dr_booking_flu/doctors_pages/widget/search_button.dart';
import 'package:dr_booking_flu/doctors_pages/widget/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class search extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return search_state();
  }
}

var key = GlobalKey<FormState>();
TextEditingController searchController = new TextEditingController();

class search_state extends State<search> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20.0),
                height: MediaQuery.of(context).size.height * 1.5 / 10,
                child: skip(doctor_list(null, 0), MainAxisAlignment.end),
              ),
              Center(
                child: Image.asset(
                  "images/choose.png",
                  width: MediaQuery.of(context).size.width * 3 / 3,
                  height: MediaQuery.of(context).size.height * 3 / 10,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 1.5 / 10,
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
                child:
                    Form(key: key, child: search_text_field(searchController)),
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
              Container(
                  height: MediaQuery.of(context).size.height * .5 / 10,
                  child: search_button(searchController.text)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 1.3 / 10,
          child: bottom_navigation()),
    );
  }
}
