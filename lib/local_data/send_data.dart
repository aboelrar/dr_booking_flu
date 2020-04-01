import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class send_data {
   void save_user_data(String id, String user_name, String user_email , String user_phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user_id", id);
    prefs.setString("user_name", user_name);
    prefs.setString("user_email", user_email);
    prefs.setString("user_phone", user_phone);
    prefs.setBool("status", true);
  }

  //SET STATUS WITH FALSE
 status() async
 {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool("status", false);
 }

 //SET STATUS WITH FALSE FOR WELCOME TOUR
 status_welcome_tour() async
 {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setBool("status_welcome_tour", true);
 }

}
