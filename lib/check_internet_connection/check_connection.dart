import 'package:connectivity/connectivity.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class check_connection {
 static var status = false; //CHECK IF FIRST TIME OR NOT

  // ignore: non_constant_identifier_names
  check_connection_method(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
 if ((connectivityResult == ConnectivityResult.wifi)||(connectivityResult == ConnectivityResult.mobile)) {
      if(status == true) {
        Navigator.pop(context);
        // I am connected to a wifi network.
        check_connection_dialog()
            .dialog(context, Colors.green, "متصل بالانترنت",status);
        status = false;
      }
    } else {
      check_connection_dialog()
          .dialog(context, Colors.red, "لايوجد اتصال بالانترنت !",status);
       status = true;
    }
  }
}
