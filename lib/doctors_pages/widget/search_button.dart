import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search_button extends StatelessWidget{
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

      },
      child: Text(
        'بحث',
        style: TextStyle(fontSize: 15.0),
      ),
    );
  }

}