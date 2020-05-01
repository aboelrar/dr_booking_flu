import 'package:connectivity/connectivity.dart';
import 'package:dr_booking_flu/check_internet_connection/check_connection.dart';
import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class check_connection_listner
{
   check_connection_listner(BuildContext context)
   {
     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
       check_connection().check_connection_method(context);
     });
   }
}

