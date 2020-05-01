import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class app_logo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Image.asset(
      "images/medicc.png", width: MediaQuery.of(context).size.width*2/3, height: MediaQuery
        .of(context)
        .size
        .height * 2.5 / 10,
      );
  }
  
}