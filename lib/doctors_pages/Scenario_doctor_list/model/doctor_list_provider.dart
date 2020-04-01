// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class doctor_list_provider extends ChangeNotifier{

  List<int> _doc_list;

  get doc_list => _doc_list;

  set doc_list(value) {
    _doc_list = value;
    notifyListeners();
  }

  setList(List<int>  list)
  {
    this._doc_list= list;
    notifyListeners();
  }

}