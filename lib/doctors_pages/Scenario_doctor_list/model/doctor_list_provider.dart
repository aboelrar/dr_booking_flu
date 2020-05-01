// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class doctor_list_provider extends ChangeNotifier{

  List<int> _doc_list;

  get doc_list => _doc_list;

  var _color;

  set doc_list(value) {
    _doc_list = value;
    notifyListeners();
  }

  setList(List<int>  list)
  {
    this._doc_list= list;
    notifyListeners();
  }


  setitemList(int index,int element)
  {
    _doc_list.removeAt(index);
    _doc_list.insert(index,element);

    print('${index},,.....${element}');
    print('${doc_list},,.....xxxx');

    notifyListeners();
  }

  get color => _color;

  set color(value) {
    _color = value;
  }

  set_color(int fav_flag)
  {
    //SET ICON FAV COLOR
    if (fav_flag == 1) {
      color = Colors.red;
    } else {
      color = Colors.black;
    }
    print('xxccoo${color}....${fav_flag}');
    notifyListeners();
  }

  change_color(int fav_flag)
  {
    //SET ICON FAV COLOR
    if (fav_flag == 1) {
      color = Colors.red;
    } else {
      color = Colors.black;
    }
    print('pela_chaio${color}....${fav_flag}');
    notifyListeners();
  }


}