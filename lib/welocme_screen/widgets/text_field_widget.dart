import 'package:dr_booking_flu/welocme_screen/scenario_login/model/text_input.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/model/text_input.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/model/text_input.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/model/text_input.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_login/model/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class text_field_widget extends StatelessWidget {
  String hint;
   var prefixIcon, suffixIcon;

  text_field_widget(String hint, var prefixIcon) {
    this.hint = hint;
    this.prefixIcon = prefixIcon;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final text_input textInput = Provider.of<text_input>(context);

    return TextFormField(
      onFieldSubmitted: (term) {
        // process
        textInput.set_icon(Icons.delete);
        if(prefixIcon==Icons.email)
          {
            suffixIcon=textInput.icon;
          }
      },

      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(
          textInput.icon,
          color: Colors.blue,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        hintText: hint,
      ),
    );
  }
}
