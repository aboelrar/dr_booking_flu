import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/app_widget/app_bar.dart';
import 'package:dr_booking_flu/app_widget/progress_bar.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection_listner.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/model/Date.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/model/Date.dart'
    as prefix0;
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/model/Doctor.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/model/root_doc_details.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/widget/appoienments.dart';
import 'package:dr_booking_flu/doctors_pages/widget/drawer_paint_doc_list.dart';
import 'package:dr_booking_flu/google_map/ui/map.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: camel_case_types
class doctor_details extends StatelessWidget {
  List<Marker> map_list = List<Marker>(); //DEFINE MAP LIST
  String id;
  var lat, lng;
  var lat_num, lng_num; //LAT AND LNG FOR MAP

  doctor_details(this.id, this.lat, this.lng);

  //ADD DATA TO MAP LIST
  add_maplist_data() {
    lat_num = double.parse(lat); //CONVERT LAT FROM STRING TO DOUBLE
    lng_num = double.parse(lng); //CONVERT LNG FROM STRING TO DOUBLE

    map_list.add(Marker(
        markerId: MarkerId('mymarker'), position: LatLng(lat_num, lng_num)));
  }

  @override
  Widget build(BuildContext context) {
    add_maplist_data(); //CALL METHOD THAT DATA ADDED IN

    check_connection_listner(context); //CONNECTION LISTNER

    // TODO: implement build
    return Scaffold(
      appBar: app_bar("تفاصيل الطبيب"),
      body: Stack(children: <Widget>[
        CustomPaint(
          painter: DrawerPaint_doc_list(
            curveColor: const Color(0xff40C8C8C8),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 2 / 4,
            height: double.infinity,
          ),
        ),
        ListView(
          children: <Widget>[
            FutureBuilder(
                future: Api_Call().get_doc_details(id),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: progress_bar().progress_bar_loading(context),
                    );
                  } else {
                    root_doc_details rootDocDetails =
                        root_doc_details.fromJSON(snapshot.data);
                    Doctor doctor = Doctor.fromJSON(rootDocDetails.doctor);

                    //CHECK THERE IS DATES OR NOT
                    List<Date> date_list = List<Date>();
                    if (rootDocDetails.dates == null) {
                    } else {
                      for (int index = 0;
                          index < rootDocDetails.dates.length;
                          index++) {
                        Date dates = Date.fromJSON(rootDocDetails.dates[index]);
                        date_list.add(dates);
                      }
                    }

                    return Stack(
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    right: MediaQuery.of(context).size.width *
                                        .5 /
                                        10,
                                    left: MediaQuery.of(context).size.width *
                                        .5 /
                                        10),
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 1 / 4,
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: FancyShimmerImage(
                                        imageUrl: doctor.image,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                3.6 /
                                                10,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                1 /
                                                5,
                                        shimmerBaseColor: Colors.grey,
                                        shimmerHighlightColor: Colors.white,
                                        shimmerBackColor: Colors.blue,
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(
                                          right: 15.0, left: 10.0),
                                      width: MediaQuery.of(context).size.width *
                                          5.4 /
                                          10,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              2 /
                                              3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.0),
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    child: Icon(
                                                      Icons.star,
                                                      color:
                                                          Colors.orangeAccent,
                                                      size: 20,
                                                    ),
                                                    color:
                                                        const Color(0xff524D4C),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20),
                                                  child: AutoSizeText(
                                                    '${doctor.rating}',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'thesansbold',
                                                        fontSize: 30.0,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: <Widget>[
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          11.0),
                                                  child: Container(
                                                    height: 35,
                                                    width: 35,
                                                    child: Icon(
                                                      Icons.monetization_on,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 20),
                                                  child: AutoSizeText(
                                                    "${doctor.price} ريال",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'thesansbold',
                                                        fontSize: 20.0,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return map(lat, lng);
                                              }));
                                            },
                                            child: Container(
                                              margin:
                                                  EdgeInsets.only(top: 10.0),
                                              child: Row(
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            11.0),
                                                    child: Container(
                                                      height: 35,
                                                      width: 35,
                                                      child: Icon(
                                                        Icons.place,
                                                        color: Colors.white,
                                                        size: 20,
                                                      ),
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 20),
                                                    child: AutoSizeText(
                                                      "رؤية الخريطة",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'thesansbold',
                                                          fontSize: 15.0,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20.0,
                                    left: 20.0,
                                  ),
                                  child: AutoSizeText(
                                    doctor.name,
                                    style: TextStyle(
                                        fontFamily: 'thesansbold',
                                        fontSize: 25.0,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 20.0, left: 20.0, top: 5.0),
                                  child: AutoSizeText(
                                    doctor.jobTitle,
                                    style: TextStyle(
                                        fontFamily: 'thesansbold',
                                        fontSize: 15.0,
                                        color: const Color(0xff524D4C)),
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height *
                                    .01 /
                                    10,
                                color: const Color(0xff1A000000),
                                margin: EdgeInsets.only(
                                    right: 20.0, left: 20.0, top: 15.0),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(
                                          right: 20.0, left: 20.0, top: 5.0),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .3 /
                                              4,
                                      child: Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.place,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(right: 5.0),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.5 /
                                                2,
                                            child: AutoSizeText(
                                              doctor.address,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 13.0,
                                                  color:
                                                      const Color(0xff524D4C),
                                                  fontFamily: 'thesansbold'),
                                              maxLines: 2,
                                              textAlign: TextAlign.right,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  right: 10,
                                  left: 10,
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 170,
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(lat_num, lng_num),
                                      zoom: 18.0),
                                  markers: Set.from(map_list),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height *
                                    .01 /
                                    10,
                                color: const Color(0xff1A000000),
                                margin: EdgeInsets.only(
                                    right: 20.0, left: 20.0, top: 15.0),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(
                                    top: 10.0, right: 20.0, left: 20.0),
                                child: AutoSizeText(
                                  "الوصف",
                                  style: TextStyle(
                                      fontFamily: 'thesansbold',
                                      fontSize: 21.0,
                                      color: Colors.black),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                margin: EdgeInsets.only(
                                    top: 5.0,
                                    right: 20.0,
                                    left: 20.0,
                                    bottom: 10.0),
                                child: AutoSizeText(
                                  doctor.description,
                                  style: TextStyle(
                                      fontFamily: 'thesansbold',
                                      fontSize: 13.0,
                                      color: const Color(0xff524D4C)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 10.0,
                                    right: 20.0,
                                    left: 20.0,
                                    bottom: 10.0),
                                width: MediaQuery.of(context).size.width,
                                height: 40,
                                child: FlatButton(
                                  onPressed: () {
                                    return appoienments().call_appoienments(
                                        context,
                                        date_list,
                                        doctor.id); //CALL DIALOG
                                  },
                                  color: Theme.of(context).primaryColor,
                                  child: Text(
                                    'حجز ميعاد',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'thesansbold',
                                        color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }
                })
          ],
        )
      ]),
    );
  }
}
