import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/widget/dialog_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class appoienment_item extends StatelessWidget {
  String fromTime,toTime,reservationDate,doc_id,reservation_id;

  appoienment_item(this.fromTime, this.toTime, this.reservationDate,this.doc_id,this.reservation_id);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 90.0,
      color: Colors.transparent,
      child: new Container(
          margin: EdgeInsets.only(right: 20.0, left: 20.0, top: 10.0),
          decoration: new BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 4.5 / 10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AutoSizeText(

                      reservationDate,
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          fontFamily: 'thesansbold'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3.0,right: 3.0),
                      child: AutoSizeText(
                        'من ${fromTime} الى ${toTime}',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                            fontFamily: 'thesansbold'),
                        maxLines: 1
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 7.0),
                width: MediaQuery.of(context).size.width * 1.5 / 10,
                height: 35.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: FlatButton(
                    onPressed: () {
                      dialog_loading().loading(context,reservation_id,doc_id);
                    },
                    child: AutoSizeText(
                      'حجز',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'thesansbold'),
                    ),
                    color: Colors.blue,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
