import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class doctors_url extends ChangeNotifier{
var _api;
var _flag;
var _textColorRate = const Color(0xFFffffff);
var _bgColorRate = const Color(0xFF0089ff);
var _textColorHprice = Colors.black54;
var _bgColorHprice = Colors.white;
var _textColorLprice =Colors.black54;
var _bgColorLprice = Colors.white;

get flag => _flag;

set flag(value) {
  _flag = value;
}

set_flag(var num)
{
  _flag = num;
  notifyListeners();
}

get api => _api;

set api(value) {
  _api = value;
  notifyListeners();
}

set_method(var method)
{
  _api = method;
  print('zozo${method}');
  notifyListeners();
}

get bgColorRate => _bgColorRate;

set bgColorRate(value) {
  _bgColorRate = value;
  notifyListeners();
}

get textColorRate => _textColorRate;

set textColorRate(value) {
  _textColorRate = value;
  notifyListeners();
}

set_RateColors()
{
  _bgColorRate =  const Color(0xFF0089ff);
  _textColorRate = const Color(0xFFffffff);
  print('aaaaaaa');
  notifyListeners();
}

set_RateDefult()
{
  _bgColorRate =  const Color(0xFFffffff);
  _textColorRate = const Color(0xFF000000);
  print('bbbbbbbb');
  notifyListeners();
}

get bgColorLprice => _bgColorLprice;

set bgColorLprice(value) {
  _bgColorLprice = value;
  notifyListeners();
}

get textColorLprice => _textColorLprice;

set textColorLprice(value) {
  _textColorLprice = value;
  notifyListeners();
}

set_LpriceColors()
{
  _bgColorLprice =  const Color(0xFF0089ff);
  _textColorLprice = const Color(0xFFffffff);
  notifyListeners();
}

set_LpriceDefult()
{
  _bgColorLprice =  const Color(0xFFffffff);;
  _textColorLprice = const Color(0xFF000000);
  notifyListeners();
}


get bgColorHprice => _bgColorHprice;

set bgColorHprice(value) {
  _bgColorHprice = value;
  notifyListeners();
}

get textColorHprice => _textColorHprice;

set textColorHprice(value) {
  _textColorHprice = value;
  notifyListeners();
}


set_HpriceColors()
{
  _bgColorHprice =  const Color(0xFF0089ff);
  _textColorHprice = const Color(0xFFffffff);
  notifyListeners();
}

set_HpriceDefult()
{
  _bgColorHprice =  const Color(0xFFffffff);
  _textColorHprice = const Color(0xFF000000);
  notifyListeners();
}

}