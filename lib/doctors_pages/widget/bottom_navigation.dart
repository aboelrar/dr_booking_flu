import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class bottom_navigation extends StatelessWidget {

  static int get selectedPos => 2;

  @override
  Widget build(BuildContext context) {
    List<TabItem> tabItems = List.of([
      new TabItem(MdiIcons.barcode, "المنتجات", Theme.of(context).primaryColor,
          labelStyle:
          TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).primaryColor)),
      new TabItem(Icons.search, "البحث", Theme.of(context).primaryColor,
          labelStyle:
          TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).primaryColor)),
      new TabItem(Icons.person, "الصفحه الشخصيه", Theme.of(context).primaryColor,
          labelStyle:
          TextStyle(fontWeight: FontWeight.normal, color: Theme.of(context).primaryColor)),
    ]);

    CircularBottomNavigationController _navigationController =
    new CircularBottomNavigationController(selectedPos);

    //Bottom Navigation
    void bottom_nav(position) {
      if (position == 1) {


      } else if (position == 0) {

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