import 'package:connectivity/connectivity.dart';
import 'package:dr_booking_flu/app_widget/app_bar.dart';
import 'package:dr_booking_flu/app_widget/nodata_found.dart';
import 'package:dr_booking_flu/app_widget/progress_bar.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection_listner.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/ui/doctor_details.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/all_docsDoctor.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/all_docsRootClass.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/doctor_list_provider.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/doctors_url.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/widget/dialog_loading_filter.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/widget/filter.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/widget/filter_line.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:dr_booking_flu/doctors_pages/widget/doctor_item.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class doctor_list extends StatelessWidget {
  String search_txt;
  int flag;
  int flag_dialog = 1;
  static String status = 'rate';
  static int num_id = 0;

  doctor_list(this.search_txt, this.flag);

  @override
  Widget build(BuildContext context) {
    check_connection_listner(context); //CONNECTION LISTNER

    final doctors_url doctors_method_api = Provider.of<doctors_url>(context);
    final doctor_list_provider doctors_list_fav =
    Provider.of<doctor_list_provider>(context);


    //CHECK TO KNOW IF IT COMING FROM SEARCH OR ALL DOCTORS
    var doctor_method;
    if (flag == 0) {
      print('yyyyyesfuck');
      doctor_method =
          Api_Call().get_all_docs(search_state.id); //GET ALL DOCTORS
      doctors_method_api.set_method(doctor_method); //SAVE DATA TO PROVIDER
    } else if (flag == 1) {
      if (num_id == 0) {
        print('bubgmo');
        var doctor_method = Api_Call()
            .get_all_docs_search(search_txt, status); //GET ALL DOCTORS FILTERD
        doctors_method_api.set_method(doctor_method); //SAVE DATA TO PROVIDER
      }
    }
else if (flag == 2) {
        print('noooooooofuck');
        doctor_method =
            Api_Call().get_my_fav(search_state.id); //GET ALL FAVOURITIES
        doctors_method_api.set_method(doctor_method); //SAVE DATA TO PROVIDER
      } else if (flag == 3) {
        print('noooooooofuck');
        doctor_method = Api_Call()
            .get_my_appoienments(search_state.id); //GET ALL MY APPOIENMENTS
        doctors_method_api.set_method(doctor_method); //SAVE DATA TO PROVIDER
      }

      // TODO: implement build
      return Scaffold(
        appBar: app_bar("الاطباء"),
        body: FutureBuilder(
            future: doctors_method_api.api,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return progress_bar()
                    .progress_bar_loading(context); //IF DATA IS NULL
              } else if ((snapshot.data['status'] == 2) ||
                  (snapshot.data['status'] == 3)) {
                return nodata_found(); //IF STATUS EQUAL 2 THAT MEAN NO DATA WILL BACK
              } else {
                num_id = 1;
                flag_dialog = 0;


                //GET ALL DATA
                all_docsRootClass rootClass =
                all_docsRootClass.fromJSON(snapshot.data);
                all_docsDoctor doctors;
                List<all_docsDoctor> all_docs = List<all_docsDoctor>();
                List<int> fav_list = new List<int>();

                for (int index = 0; index < rootClass.doctors.length; index++) {
                  doctors = all_docsDoctor.fromJSON(rootClass.doctors[index]);
                  print('zobera${rootClass.doctors[index]}');

                  all_docs.add(doctors);
                }

                for (int index = 0; index < rootClass.doctors.length; index++) {
                  fav_list.add(all_docs[index].favorite);
                  doctors_list_fav.setList(fav_list);
                }


                return Stack(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          is_search(flag, context,search_txt),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: ListView.builder(
                                itemBuilder: (BuildContext context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return doctor_details(
                                                all_docs[index].id,
                                                all_docs[index].latitude,
                                                all_docs[index].longitude);
                                          }));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: doctor_item(
                                          all_docs[index].name,
                                          all_docs[index].jobTitle,
                                          all_docs[index].address,
                                          all_docs[index].price,
                                          all_docs[index].image,
                                          doctors_list_fav.doc_list[index],
                                          all_docs[index].id,
                                          all_docs[index].latitude,
                                          all_docs[index].longitude,
                                          all_docs[index].rating,
                                          index,
                                          search_txt,
                                          flag),
                                    ),
                                  );
                                },
                                itemCount: rootClass.doctors.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
            }),
      );
    }
  }
  //CHECK IF DOCTOR SEARCH OR NOT
  Widget is_search(var flag, BuildContext context,search_txt) {
    if (flag == 1) {
      return Column(
        children: <Widget>[
          filter(search_txt),
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * .2 / 4,
                left: MediaQuery.of(context).size.width * .2 / 4,
                top: 7),
            child: filter_line(),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

