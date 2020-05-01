//
//  user_details.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 9, 2020


class user_details {
  int status;
  Map<String,dynamic>  user;

  user_details.fromJSON(Map<String, dynamic> parsedJson) {    
    this.status = parsedJson['status'];    
    this.user = parsedJson['user'];    
  }
}