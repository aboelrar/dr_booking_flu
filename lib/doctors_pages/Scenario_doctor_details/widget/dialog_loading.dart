import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/widget/successfull_reservation_dialog.dart';
import 'package:dr_booking_flu/doctors_pages/widget/doctor_item.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class dialog_loading {
  loading(BuildContext context,String reservation_id,String doc_id) {
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
    onResponse(doc_id, reservation_id,context); //CALL METHOD THAT WILL CONTACT WITH DATE BASE
  }

  //CALL DATEBASE THAT RESPONSE TO MAKE RESERVATION
  onResponse(String doc_id,String reservation_id,BuildContext context)
  {
    Api_Call().make_reservation(doctor_item.id, doc_id, reservation_id).then((onValue){
      if(onValue['status']==1)
        {
          Navigator.pop(context); //CANCEL DIALOG
          Navigator.pop(context); //CANCEL DIALOG
          successful_login_dialog().success_dialog(context); //CALL SUCCESS DIALOG
        }
    });
  }

}
