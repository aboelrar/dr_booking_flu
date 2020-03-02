import 'package:dr_booking_flu/welocme_screen/Scenario_personal_info/ui/personal_information.dart';
import 'package:flutter/cupertino.dart';

// ignore: camel_case_types
class bottom_nav_provider extends ChangeNotifier {
  Widget get_to_page() {
    print('7adota remix');
    return personal_information();
    
  }
}
