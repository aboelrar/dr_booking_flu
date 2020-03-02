import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bg_container extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(200.0), bottomLeft: Radius.circular(200.0)),
      child: Container(
        height: MediaQuery.of(context).size.height * 1.5 / 4,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
