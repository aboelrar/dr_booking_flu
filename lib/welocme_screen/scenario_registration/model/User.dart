//
//  User.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on April 9, 2020

class User {  
  String id;    
  String image;    
  String mail;    
  String name;    
  String phone;    

  User.fromJSON(Map<String, dynamic> parsedJson) {    
    this.id = parsedJson['id'];    
    this.image = parsedJson['image'];    
    this.mail = parsedJson['mail'];    
    this.name = parsedJson['name'];    
    this.phone = parsedJson['phone'];    
  }
}