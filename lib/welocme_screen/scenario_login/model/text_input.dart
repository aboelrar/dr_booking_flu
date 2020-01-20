import 'package:flutter/cupertino.dart';

class text_input extends ChangeNotifier{
  var _icon ;



  get icon => _icon;

  set icon(value) {
    _icon = value;
    notifyListeners();
  }

  set_icon(var icon)
  {
    this.icon = icon;
    notifyListeners();
  }
}