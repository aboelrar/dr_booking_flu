import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class bottom_nav_provider extends ChangeNotifier {
 var _widget;

 get widget => _widget;



 Future<void> set_widget(var widget)async
{

  this._widget =  widget;
  notifyListeners();
}
}
