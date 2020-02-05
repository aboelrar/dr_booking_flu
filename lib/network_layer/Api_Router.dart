import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class Api_Router
{

  ///GET METHOD
 Future<dynamic> Perform_Request(String url) async
 {
  var response = await http.get(url);
  var data = convert.jsonDecode(response.body);
  return data;
 }

 ///POST METHOD
  Future<dynamic> Perform_Request_post(String url,Map map) async
  {
    var response = await http.post(url,body: map);
    var data = convert.jsonDecode(response.body);
    print('aboelsohab ggggg${data}');
    return data;
  }
}