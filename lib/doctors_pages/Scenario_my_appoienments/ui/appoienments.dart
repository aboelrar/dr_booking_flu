import 'package:dr_booking_flu/app_widget/app_bar.dart';
import 'package:dr_booking_flu/app_widget/nodata_found.dart';
import 'package:dr_booking_flu/app_widget/progress_bar.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection_listner.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/ui/doctor_details.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_my_appoienments/model/all_docsDoctor.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_my_appoienments/model/all_docsRootClass.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_my_appoienments/widget/doctor_item_reservation.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:dr_booking_flu/doctors_pages/widget/doctor_item.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class aappoienments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    check_connection_listner(context); //CONNECTION LISTNER

    // TODO: implement build
    return Scaffold(
      appBar: app_bar("الاطباء"),
      body: FutureBuilder(
          future: Api_Call().get_my_appoienments(search_state.id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return progress_bar().progress_bar_loading(context);
            }
            else if ((snapshot.data['status'] == 2)||(snapshot.data['status'] ==3)) {
              return nodata_found(); //IF STATUS EQUAL 2 THAT MEAN NO DATA WILL BACK
            }
            else {
              //GET ALL DATA
              all_docsRootClass rootClass =
                  all_docsRootClass.fromJSON(snapshot.data);
              all_docsDoctor doctors;
              List<all_docsDoctor> all_docs = List<all_docsDoctor>();

              for (int index = 0; index < rootClass.doctors.length; index++) {
                doctors = all_docsDoctor.fromJSON(rootClass.doctors[index]);
                all_docs.add(doctors);
              }

              return Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return doctor_details(
                                  all_docs[index].doctor_id,
                                  all_docs[index].latitude,
                                  all_docs[index].longitude);
                            }));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: doctor_item_reservation(
                                all_docs[index].name,
                                all_docs[index].jobTitle,
                                all_docs[index].address,
                                all_docs[index].price,
                                all_docs[index].image,
                                all_docs[index].favorite,
                                all_docs[index].id,
                                all_docs[index].latitude,
                                all_docs[index].longitude,
                                all_docs[index].rate,
                                all_docs[index].doctor_id ),
                          ),
                        );
                      },
                      itemCount: rootClass.doctors.length,
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
