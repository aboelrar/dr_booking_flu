import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class top_card extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 3.5 / 5,
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'images/person.png',
                  width: 100,
                  height: 100,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: AutoSizeText(
                "محمود سعد",
                style: TextStyle(fontSize: 17.0, fontFamily: 'thesansbold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0,bottom: 10.0),
              child: AutoSizeText(
                "01141012485",
                style: TextStyle(fontSize: 17.0, fontFamily: 'thesansbold'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
