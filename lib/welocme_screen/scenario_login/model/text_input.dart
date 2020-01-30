import 'package:flutter/cupertino.dart';

class text_input extends ChangeNotifier{
  var _icon,_supicon ;



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

  set_sup_icon(var icon)
  {
    this.supicon = icon;
    notifyListeners();
  }

  get supicon => _supicon;

  set supicon(value) {
    _supicon = value;
  }
}