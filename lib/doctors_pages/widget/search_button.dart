import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class search_button extends StatelessWidget{
  String search_name;


  search_button(this.search_name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      splashColor: Colors.blueAccent,
      padding: EdgeInsets.only(right: 30.0, left: 30.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (context)
            {
              return doctor_list(search_name,1);
            }
        ));
      },
      child: Text(
        'بحث',
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

}