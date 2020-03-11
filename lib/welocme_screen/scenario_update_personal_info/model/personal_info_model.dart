import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/ui/personal_information.dart';
import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/widget/bottom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class personal_info_model extends ChangeNotifier {
  String _userName = bottom_card.name,
      _email = bottom_card.email,
      _phone = bottom_card.phone;


  String get userName => _userName;

  set userName(String value) {
    _userName = value;
    notifyListeners();
  }

  set_username(String value)
  {
    _userName = value;
    notifyListeners();
  }

  get email => _email;

  set email(value) {
    _email = value;
    notifyListeners();
  }

  set_email(String value)
  {
    _email = value;
    notifyListeners();
  }

  get phone => _phone;

  set phone(value) {
    _phone = value;
    notifyListeners();
  }

  set_phone(String value)
  {
    _phone = value;
    notifyListeners();
  }
}
