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

  text_field_widget(String hint, var prefixIcon,var suffixIcon) {
    this.hint = hint;
    this.prefixIcon = prefixIcon;
    this.suffixIcon=suffixIcon;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final text_input textInput = Provider.of<text_input>(context);

    return TextFormField(
      onFieldSubmitted: (term) {
        text_field_submit(term,textInput);
      },

      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(
          suffixIcon,
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


  //NUM THAT USE TO COMARE WHEN WILL DO YES
  static int num=0;

  //METHOD TO DO YES AFTER SUCCESS THING
  void text_field_submit(String term,var textInput)
  {
    // process
    if(term.isEmpty)
    {
      return null;
    }
    else if(num==0)
    {
      textInput.set_icon(Icons.done);
      num=1;
    }
    else if(num==1)
    {
      textInput.set_sup_icon(Icons.done);
    }
  }
}
