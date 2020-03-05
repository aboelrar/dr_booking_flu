import 'package:flutter/cupertino.dart';

class line extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return   Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 2,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xff33d3d3d3),
    );
  }

}