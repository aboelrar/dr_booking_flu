import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/app_widget/skip.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_search/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class on_boarding_item extends StatelessWidget {
  String name, image, desc;

  on_boarding_item(String name, String image, String desc) {
    this.name = name;
    this.image = image;
    this.desc = desc;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 5 / 10,
            width: MediaQuery.of(context).size.width * 3 / 3,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 3 / 10,
            child: Column(
              children: <Widget>[
                AutoSizeText(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22.0, fontFamily: 'thesansbold'),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AutoSizeText(
                    desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: 'thesansbold',
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
          skip(search(),MainAxisAlignment.center),
          
        ],
      ),
    );
  }
}
