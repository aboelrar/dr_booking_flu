import 'package:dr_booking_flu/local_data/send_data.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/model/UserDatum.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/model/root_user_info.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_registration/model/User.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_registration/model/user_details.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_welcome_tour/ui/welcome_tour.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/error_login_dialog.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/error_signup_dialog.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/progress_dialog.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/successful_login_dilaog.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/successfull_login_dialog.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/successfull_signup_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:progress_dialog/progress_dialog.dart';

class welcome_button extends StatelessWidget {
  String btn_name, username, password, mail, phone;
  int flag;

  welcome_button(String btn_name, String username, String password, String mail,
      String phone, int flag) {
    this.btn_name = btn_name;
    this.username = username;
    this.password = password;
    this.mail = mail;
    this.phone = phone;
    this.flag = flag;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FlatButton(
      color: Theme.of(context).primaryColor,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      splashColor: Colors.blueAccent,
      padding: EdgeInsets.only(right: 30.0, left: 30.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      onPressed: () {
        //successful_login_dilog().show_dialog(context);
        progress_dialog().show_dialog(context);
        response(context);
      },
      child: Text(
        btn_name,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

  //DATA AFTER RESPONSE LOGIC HERE
  void response(BuildContext context) {
    if (flag == 1) {
      Api_Call().login(username, password).then((value) {
        //ACTIONS HERE
        if (value['status'] == 1) {
          progress_dialog.pr.dismiss(); //DISMISS DIALOG

          root_user_info name =
              root_user_info.fromJSON(value); //GET ROOT CLASS OF ALL RESPONSE
          UserDatum datum = UserDatum.fromJSON(name.userData); //GET USER DATA

          String userName = datum.name; //GET EMAIL
          String email = datum.mail; //GET EMAIL
          String phone = datum.phone; //GET PHONE
          String id = datum.id; //GET ID

          send_data().save_user_data(
              id, userName, email, phone); //SAVE DATA TO SHAREDPREFRENCES

          successful_login_dialog()
              .success_dialog(context); //OPEN SUCCESS DIALOG

        } else if (value['status'] == 2) {
          progress_dialog.pr.dismiss(); //DISMISS DIALOG
          error_login_dialog().error_dialog(context); //OPEN ERROR DIALOG

        }
      });
    } else if (flag == 2) {
      //IF IT IS SIGN UP
      Api_Call().sign_up(username, password, mail, phone).then((value) {
        progress_dialog.pr.dismiss(); //DISMISS DIALOG

        //ACTIONS HERE
        if (value['status'] == 1) {
          //IF SIGN UP SUCCESS

          String user_id = value['id_user']; //GET USER ID

          onResponse_signup(user_id,context); //GET DATA FROM SERVER

        } else if (value['status'] == 2) {
          error_signup_dialog().error_dialog(context,value['message']); //OPEN ERROR DIALOG
        }
      });
    }
  }

  //GET DATA FROM SERVER SIGN UP
  onResponse_signup(String user_id,BuildContext context)
  {
    Api_Call().get_indo(user_id).then((value){
      if(value['status']==1)
        {
          user_details name =
          user_details.fromJSON(value); //GET ROOT CLASS OF ALL RESPONSE
          User datum = User.fromJSON(name.user); //GET USER DATA

          String userName = datum.name; //GET EMAIL
          String email = datum.mail; //GET EMAIL
          String phone = datum.phone; //GET PHONE
          String id = datum.id; //GET ID

          send_data().save_user_data(
              id, userName, email, phone); //SAVE DATA TO SHAREDPREFRENCES

          successfull_signup_dialog()
              .success_dialog(context); //OPEN SUCCESS DIALOG
        }
    });
  }
}
