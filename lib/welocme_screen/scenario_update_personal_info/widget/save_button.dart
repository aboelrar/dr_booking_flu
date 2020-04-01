import 'package:dr_booking_flu/local_data/send_data.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/model/personal_info_model.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';


class save_button extends StatelessWidget {
  String id;

  //GET DATA FROM LOCAL
  get_data_fromlocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    id = prefs.get('user_id'); //GET ID
  }

  @override
  Widget build(BuildContext context) {
    final personal_info_model personal_info_data =
        Provider.of<personal_info_model>(context); //GET DATA FROM PROVIDER

    get_data_fromlocal(); //GET DATA FROM SERVER

    // TODO: implement build
    return FlatButton(
      color: Colors.white,
      textColor: Colors.white,
      disabledColor: Colors.white,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(18.0),
          side: BorderSide(color: Theme.of(context).primaryColor)),
      child: Text(
        "حفظ",
        style: TextStyle(
            fontSize: 13.0, fontFamily: 'thesansbold', color: Colors.black),
      ),
      onPressed: () {
        progress_dialog().show_dialog(context);
        response(
            id,
            personal_info_data.userName,
            personal_info_data.email,
            personal_info_data.phone,
            context); //CALL API OF EDIT DATA WHEN PRESSED ON SAVE BUTTON
      },
    );
  }

  //THIS IS METHOD USED TO SEND DATA TO SERVER
  response(String user_id, String user_name, String user_email,
      String user_phone, BuildContext context) {
    new Api_Call()
        .edit_my_profile(user_id, user_name, user_email, user_phone)
        .then((onValue) {
      if (onValue['status'] == 1) {
        progress_dialog().dismiss_dialog(context);
        Toast.show("تم التعديل بنجاح...", context,backgroundColor: Colors.green);
        send_data().save_user_data(
            user_id, user_name, user_email, user_phone); //SAVE DATA TO SHAREDPREFRENCES

      }
    });
  }
}
