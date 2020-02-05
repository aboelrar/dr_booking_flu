
import 'package:dr_booking_flu/network_layer/Api_Router.dart';
import 'package:dr_booking_flu/network_layer/Apiclient.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/ui/login.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_registration/ui/sign_up.dart';

class Api_Call {

  Api_Router _Api_Router = Api_Router();


  //LOGIN
   Future<dynamic> login(Map map)async
  {
    return await _Api_Router.Perform_Request_post(Apiclient.login, map);
  }

//SIGN_UP
  Future<dynamic> sign_up(Map map)async
  {
    return await _Api_Router.Perform_Request_post(Apiclient.sign_up, map);
  }


}