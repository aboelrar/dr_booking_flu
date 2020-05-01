import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dr_booking_flu/app_widget/skip.dart';
import 'package:dr_booking_flu/app_widget/skip_doctors.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection_listner.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_search/ui/search_page.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/model/bottom_nav.dart';
import 'package:dr_booking_flu/doctors_pages/widget/bottom_navigation.dart';
import 'package:dr_booking_flu/doctors_pages/widget/search_button.dart';
import 'package:dr_booking_flu/doctors_pages/widget/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return search_state();
  }
}

var key = GlobalKey<FormState>();
TextEditingController searchController = new TextEditingController();

class search_state extends State<search> {
  int status = 0;

  @override
  Widget build(BuildContext context) {

    check_connection_listner(context); //CONNECTION LISTNER

    final bottom_nav_provider personal_info_data =
        Provider.of<bottom_nav_provider>(context); //GET DATA FROM PROVIDER
    if (status == 0) {
      personal_info_data.set_widget(search_page());
      status = 1;
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: personal_info_data.widget,
      bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height * 1.3 / 10,
          child: bottom_navigation()),
    );
  }

  //GET ALL DATA IN MAIN SCREEN TO REUSABLE
  static String id,name,phone;
  get_data_fromlocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.get('user_id'); //GET ID
    name = prefs.get('user_name'); //GET USER NAME
    phone = prefs.get('user_phone'); //GET USER PHONE
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_data_fromlocal();
  }
}
