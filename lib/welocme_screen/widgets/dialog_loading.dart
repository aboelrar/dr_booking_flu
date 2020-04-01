import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/doctor_list_provider.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/widget/filter.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class dialog_loading {
  loading(BuildContext context, String item_id, String user_id, int flag) {
    final doctor_list_provider doctors_list_fav = Provider.of<doctor_list_provider>(context);

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
    onResponse(user_id, item_id,flag, context,doctors_list_fav); //GET DATA FROM SERVER
  }

  //CALL SERVER
  onResponse(String user_id, String item_id,int flag, BuildContext context,doctor_list_provider doctors_list_fav) {

    List <int> list= List<int>();
    list.add(1);
    if(flag == 0)  //IF FLAG EQUAL ZERO THAT MEAN FAV IS BLACK AND WE WILL CALL ADD TO FAV
      {
        Api_Call().add_to_fav(user_id, item_id).then((onValue) {
          if (onValue['status'] == 1) {
            doctors_list_fav.setList(list);
            Navigator.pop(context); //CANCEL DIALOG

          }
        });
      }
    else{ //IF FLAG EQUAL ONE THAT MEAN ITS ALREADY IS FAVOURITE AND WE WILL CALL DELETE FAV
      Api_Call().delete_fav(user_id, item_id).then((onValue) {
        if (onValue['status'] == 1) {
          Navigator.pop(context); //CANCEL DIALOG
          doctors_list_fav.setList(list);
        }
      });
    }

  }
}
