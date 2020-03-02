import 'package:circular_bottom_navigation/tab_item.dart';

import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/ui/personal_information.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';


// ignore: camel_case_types
class bottom_navigation extends StatelessWidget {


  static int get selectedPos => 1;

  @override
  Widget build(BuildContext context) {

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
    void bottom_nav(position) {
      if (position == 1) {
        print('ssssssssyessr');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return personal_information();
            }));
      } else if (position == 0) {
        print('nooooopppppwwwww');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return personal_information();
            }));
      }
    }

    // TODO: implement build
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: 50.0,
      barBackgroundColor: Colors.white,
      selectedCallback: (int selectedPos) {
        bottom_nav(selectedPos);
      },
    );
  }

}