import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/doctors_url.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class dialog_loading_filter {
  loading(BuildContext context) {
    final doctors_url doctors_method_api = Provider.of<doctors_url>(context);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 1.1 / 4,
                left: MediaQuery.of(context).size.width * 1.1 / 4),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                height: 110.0,
                child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'images/all_docs_loading.png',
                          width: 65,
                          height: 65,
                        ),
                        Loading(
                            indicator: BallPulseIndicator(),
                            size: 40.0,
                            color: Theme.of(context).primaryColor)
                      ],
                    )),
              ),
            ),
          );
        });

    sleep(context);
  }


    void sleep(BuildContext context) async {
      await Future.delayed(Duration(seconds: 1));
      Navigator.pop(context); //CANCEL DIALOG

    }
}