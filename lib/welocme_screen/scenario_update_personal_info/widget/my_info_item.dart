import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';

// ignore: camel_case_types
class my_info_item extends StatelessWidget {
  String txt_name, image, title;
  int flag;  //USING FLAG TO DETEMIND WHICH ITEM WILL EDIT FIRST ,SECOND , THIRD
  my_info_item(this.txt_name, this.image, this.title, this.flag);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding:
          EdgeInsets.only(right: MediaQuery.of(context).size.width * .5 / 10),
      width: MediaQuery.of(context).size.width,
      height: 40,
      child: Row(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(
                    image,
                    width: MediaQuery.of(context).size.width * 1 / 10,
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 6 / 10,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30.0),
                      child: AutoSizeText(
                        txt_name,
                        style: TextStyle(
                            fontSize: 16.0, fontFamily: 'thesansbold'),
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  dialog().dialog_method(context, txt_name, title ,flag );
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
