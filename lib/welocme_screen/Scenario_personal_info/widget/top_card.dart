import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class top_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 5.0),
        width: MediaQuery.of(context).size.width * 3.5 / 5,
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'images/person_user.png',
                  width: 70,
                  height: 70,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AutoSizeText(
                search_state.name,
                style: TextStyle(fontSize: 17.0, fontFamily: 'thesansbold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0,bottom: 10.0),
              child: AutoSizeText(
                search_state.phone,
                style: TextStyle(fontSize: 17.0, fontFamily: 'thesansbold'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
