import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/model/Date.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/widget/appoienment_item.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/no_appoienments.dart';
import 'package:flutter/material.dart';

class appoienments {
  // ignore: non_constant_identifier_names
  call_appoienments(BuildContext context, List<Date> dateList, String docId) {

    if(dateList.length==0)
      {
        no_appoienments_dialog(context);  //NO APPOIENMENTS AVAILABLE
      }
    else
      {
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0 / 4,
                left: MediaQuery.of(context).size.width * 0 / 4),
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  padding: EdgeInsets.only(top: 10.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 7.5 / 10,
                  child: Column(
                    children: <Widget>[
                      AutoSizeText(
                        'المواعيد المتاحه',
                        style: TextStyle(
                            fontFamily: 'thesansbold',
                            fontSize: 18.0,
                            color: Colors.red),
                      ),

                      Expanded(
                        child: ListView.builder(
                            itemCount: dateList.length,
                            itemBuilder: (BuildContext context, index) {
                              return appoienment_item(
                                  dateList[index].fromTime,
                                  dateList[index].toTime,
                                  dateList[index].reservationDate,
                                  docId,
                                  dateList[index].id);
                            }),
                      ),
                    ],
                  )),
            ));
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
              Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }}
}
