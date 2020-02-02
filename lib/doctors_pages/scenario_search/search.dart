import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Container(
      child: Column(

        children: <Widget>[
          Center(
            child: Image.asset(
              "images/booking.png",
              width: MediaQuery.of(context).size.width*2/3,
              height: MediaQuery.of(context).size.height * 1 / 10,
            ),
          )
        ],
      ),
    ));
  }
}
