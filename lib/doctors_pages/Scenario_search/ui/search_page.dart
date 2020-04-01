import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/app_widget/skip_doctors.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/doctors_url.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:dr_booking_flu/doctors_pages/widget/search_button.dart';
import 'package:dr_booking_flu/doctors_pages/widget/search_text_field.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class search_page extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return search_state();
  }

}
class search_state extends State<search_page>{

  var key = GlobalKey<FormState>();
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    final doctors_url doctors_method_api = Provider.of<doctors_url>(context); //DEFINE PROVIDER

    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 20.0),
              height: MediaQuery.of(context).size.height * 1.5 / 10,
              child: skip_doctors(doctor_list(null, 0), MainAxisAlignment.end),
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
                child: FlatButton(
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
                          return doctor_list(searchController.text,1);
                        }
                    ));
                  },
                  child: Text(
                    'بحث',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

}