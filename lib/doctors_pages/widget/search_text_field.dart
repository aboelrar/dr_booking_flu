import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class search_text_field extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 60.0, left: 60.0),
      child: TextFormField(
        style: TextStyle(),
        decoration: InputDecoration(
          labelText: 'ما هى اعراض مرضك ؟',
          labelStyle: (TextStyle(
              fontFamily: 'thesansbold', color: Colors.grey, fontSize: 14.0)),
          filled: true,
          suffixIcon: Icon(
            Icons.search,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
