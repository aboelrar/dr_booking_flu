import 'package:dr_booking_flu/welocme_screen/scenario_welcome_tour/ui/welcome_tour.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/successful_login_dilaog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class welcome_button extends StatelessWidget{
  String btn_name;
  welcome_button(String btn_name)
  {
    this.btn_name=btn_name;
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
      padding: EdgeInsets.only(right: 30.0,left: 30.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
      ),
      onPressed: () {
        //successful_login_dilog().show_dialog(context);
        Navigator.push(context, MaterialPageRoute(
            builder: (context)
            {
              return welcome_tour();
            }
        ));
      },
      child: Text(
        btn_name,
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

}