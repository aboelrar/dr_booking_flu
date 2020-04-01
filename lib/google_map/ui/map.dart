import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/app_widget/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatelessWidget {
  List<Marker> map_list = List<Marker>(); //DEFINE MAP LIST

  var lat,lng;

  var lat_num,lng_num;  //LAT AND LNG FOR MAP

  map(this.lat, this.lng);

  //ADD DATA TO MAP LIST
  add_maplist_data() {

     lat_num = double.parse(lat); //CONVERT LAT FROM STRING TO DOUBLE
     lng_num = double.parse(lng); //CONVERT LNG FROM STRING TO DOUBLE

    map_list.add(Marker(
        markerId: MarkerId('mymarker'),
        position: LatLng(lat_num, lng_num)));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    add_maplist_data(); //CALL METHOD THAT DATA ADDED IN

    return Scaffold(
      appBar: app_bar("الخريطة"),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(lat_num, lng_num), zoom: 18.0),
          markers: Set.from(map_list),
        ),
      ),
    );
  }
}
