import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class save_button extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
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
            fontSize: 13.0,
            fontFamily: 'thesansbold',
            color: Colors.black),
      ),
      onPressed: () {},
    );
  }

}