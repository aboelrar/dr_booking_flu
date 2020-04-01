import 'package:dr_booking_flu/welocme_screen/scenario_login/model/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class text_field_widget extends StatelessWidget {
  String hint;
  var prefixIcon, suffixIcon ,keyboard_type,obscureText;
  TextEditingController controller;

  text_field_widget(String hint, var prefixIcon,var suffixIcon,TextEditingController controller,var keyboard_type,var obscureText) {
    this.hint = hint;
    this.prefixIcon = prefixIcon;
    this.suffixIcon = suffixIcon;
    this.controller = controller;
    this.keyboard_type = keyboard_type;
    this.obscureText = obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final text_input textInput = Provider.of<text_input>(context);

    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboard_type,
      controller: controller ,
      onFieldSubmitted: (term) {
        text_field_submit(term,textInput);
      },

      style: TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
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
      num=1;
    }
    else if(num==1)
    {
    }
  }
}
