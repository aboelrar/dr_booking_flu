import 'package:flutter/cupertino.dart';

class image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(
      'images/person_user.png',
      width: MediaQuery.of(context).size.width * .6 / 4,
      height: MediaQuery.of(context).size.height * .6 / 4,
    );
  }
}
