import 'package:dr_booking_flu/network_layer/Api_Router.dart';
import 'package:dr_booking_flu/network_layer/Apiclient.dart';

class Api_Call {
  Api_Router _Api_Router = Api_Router();

  //LOGIN
  Future<dynamic> login(String username, String password) async {
    print('eeeeeeeeee${Apiclient.login}/${username}/${password}');

    return await _Api_Router.Perform_Request(
        '${Apiclient.login}/${username}/${password}');
  }

//SIGN_UP
  Future<dynamic> sign_up(
      String username, String password, String email, String phone) async {
    return await _Api_Router.Perform_Request('${Apiclient.sign_up}/${username}/${email}/${phone}/${password}');
  }

  //GET_DOCTOR_LIST
  Future<dynamic> get_all_docs() async {
    return await _Api_Router.Perform_Request(Apiclient.get_all_doctors);
  }

  //GET_DOCTOR_LIST_USING_SEARCH
  Future<dynamic> get_all_docs_search(
      String search_name, String search_filter) async {
    print('yres${Apiclient.get_search_doctors}/${search_name}/${search_filter}/1');
    return await _Api_Router.Perform_Request(
        '${Apiclient.get_search_doctors}/${search_name}/${search_filter}/1');
  }

  //GET DOCTOR DETAILS
  Future<dynamic> get_doc_details(String id) async {
    print('${Apiclient.doctor_details}/${id}/1');
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

  //ADD TO FAVOURITE
  Future<dynamic> add_to_fav(String user_id, String item_id) async {
    print('zzzzzz${Apiclient.Add_fav}/${user_id}/${item_id}');

    return await _Api_Router.Perform_Request(
        '${Apiclient.Add_fav}/${user_id}/${item_id}');
  }

  //DELETE TO FAVOURITE
  Future<dynamic> delete_fav(String user_id, String num_fav) async {
    return await _Api_Router.Perform_Request(
        '${Apiclient.Delete_fav}/${user_id}/${num_fav}');
  }

  //MAKE RESERVATION
  Future<dynamic> make_reservation(String user_id,String doctor_id, String reservation_id) async {
    return await _Api_Router.Perform_Request(
        '${Apiclient.Make_reservation}/${user_id}/${doctor_id}/${reservation_id}');
  }
}
