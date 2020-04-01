import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/model/Date.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/widget/appoienment_item.dart';
import 'package:flutter/material.dart';

class appoienments {
  // ignore: non_constant_identifier_names
  call_appoienments(BuildContext context, List<Date> dateList, String docId) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
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
                    child: Column(
                      children: <Widget>[
                        AutoSizeText(
                          'اختر ميعاد الحجز',
                          style: TextStyle(
                              fontFamily: 'thesansbold',
                              fontSize: 18.0,
                              color: Theme.of(context).primaryColor),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              right: 20.0, left: 20.0, top: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Image.asset(
                                'images/ticket.png',
                                width: 60.0,
                                height: 60.0,
                              ),
                              AutoSizeText(
                                '300 ريال',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontFamily: 'thesansbold',
                                    color: Colors.pink),
                              )
                            ],
                          ),
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
        });
  }
}
