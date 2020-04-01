import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class nodata_found extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 30.0),
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'images/no_data_found.png',
            width: MediaQuery.of(context).size.width * 3 / 5,
            height: MediaQuery.of(context).size.height * 2 / 5,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: AutoSizeText(
              'عفوا لا يوجد اطباء !',
              style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.black,
                  fontFamily: 'thesansbold'),
            ),
          )
        ],
      ),
    );
  }
}
