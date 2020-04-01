import 'dart:async';
import 'dart:math';

import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_search/ui/search_page.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/model/bottom_nav.dart';

import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/ui/personal_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:provider/provider.dart';


// ignore: camel_case_types
class bottom_navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return bottom_state();
  }
}

class bottom_state extends State<bottom_navigation>
{
  static int get selectedPos => 1;

  @override
  Widget build(BuildContext context) {

    final bottom_nav_provider personal_info_data = Provider.of<bottom_nav_provider>(context); //GET DATA FROM PROVIDER


    List<TabItem> tabItems = List.of([
      new TabItem(Icons.person, "الصفحه الشخصيه", Theme.of(context).primaryColor,
          labelStyle:
          TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).primaryColor)),
      new TabItem(Icons.search, "البحث", Theme.of(context).primaryColor,
          labelStyle:
          TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).primaryColor)),

    ]);

    CircularBottomNavigationController _navigationController =
    new CircularBottomNavigationController(selectedPos);

    //Bottom Navigation
    // ignore: non_constant_identifier_names
    Future<void> bottom_nav(position) async  {
      print('pos is :${position}');


         if (position == 0) {
         await personal_info_data.set_widget(personal_information());
        }
         else {
         await  personal_info_data.set_widget(search_page());

         }
    }

    // TODO: implement build
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: 50.0,
      barBackgroundColor: Colors.white,
      selectedCallback: (int selectedPos) {

        bottom_nav(selectedPos) ;
      },
    );
  }

}

