import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class app_bar extends StatelessWidget with PreferredSizeWidget{

  String app_title;

  app_bar(this.app_title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      centerTitle: true,
      title: AutoSizeText(app_title,style: TextStyle(color: Colors.white,
          fontSize: 20.0,
          fontFamily: 'thesansbold'),),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}