import 'package:dr_booking_flu/network_layer/Api_Router.dart';
import 'package:dr_booking_flu/network_layer/Apiclient.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/ui/login.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_registration/ui/sign_up.dart';

class Api_Call {
  Api_Router _Api_Router = Api_Router();

  //LOGIN
  Future<dynamic> login(String username, String password) async {
    return await _Api_Router.Perform_Request(
        '${Apiclient.login}/${username}/${password}');
  }

//SIGN_UP
  Future<dynamic> sign_up(Map map) async {
    return await _Api_Router.Perform_Request_post(Apiclient.sign_up, map);
  }

  //GET_DOCTOR_LIST
  Future<dynamic> get_all_docs() async {
    return await _Api_Router.Perform_Request(Apiclient.get_all_doctors);
  }

  //GET_DOCTOR_LIST_USING_SEARCH
  Future<dynamic> get_all_docs_search(
      String search_name, String search_filter) async {
    print('${Apiclient.get_search_doctors}/${search_name}/${search_filter}/1');
    return await _Api_Router.Perform_Request(
        '${Apiclient.get_search_doctors}/${search_name}/${search_filter}/1');
  }

  //GET DOCTOR DETAILS
  Future<dynamic> get_doc_details(String id) async {
    return await _Api_Router.Perform_Request(
        '${Apiclient.doctor_details}/${id}/1');
  }

  //GET MY DOCTOR FAVOURITIES
  Future<dynamic> get_my_fav(String user_id) async {
    print('xxxxx${Apiclient.doctor_myfav}/${user_id}');
    return await _Api_Router.Perform_Request(
        '${Apiclient.doctor_myfav}/${user_id}');
  }

  //GET MY DOCTOR APPOIENMENTS
  Future<dynamic> get_my_appoienments(String user_id) async {
    print('xxxxx${Apiclient.doctor_myappoienments}/${user_id}');
    return await _Api_Router.Perform_Request(
        '${Apiclient.doctor_myappoienments}/${user_id}');
  }

  //EDIT MY PERSONAL PROFILE
  Future<dynamic> edit_my_profile(String user_id, String user_name,
      String user_email, String user_phone) async {
    print('xxxxx${Apiclient.edit_profile}/${user_id}');
    return await _Api_Router.Perform_Request(
        '${Apiclient.edit_profile}/${user_id}/${user_name}/${user_email}/${user_phone}');
  }
}
