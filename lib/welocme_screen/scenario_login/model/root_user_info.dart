//
//  root_user_info.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 7, 2020

import 'package:dr_booking_flu/welocme_screen/scenario_login/model/UserDatum.dart';

class root_user_info {
  int status;
  Map<String,dynamic> userData;

  root_user_info.fromJSON(Map<String, dynamic> parsedJson) {
    this.status = parsedJson['status'];
    this.userData = parsedJson['user_data'];
  }
}