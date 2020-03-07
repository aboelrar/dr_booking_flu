//
//  UserDatum.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 7, 2020

class UserDatum {  
  String address;    
  String cityId;    
  String created;    
  String createdBy;    
  String date;    
  String deleted;    
  String gender;    
  String id;    
  String jobType;    
  String lastUpdatedBy;    
  String mail;    
  String name;    
  String password;    
  String phone;    
  String photo;    
  String status;    
  String verified;    

  UserDatum.fromJSON(Map<String, dynamic> parsedJson) {    
    this.address = parsedJson['address'];    
    this.cityId = parsedJson['city_id'];    
    this.created = parsedJson['created'];    
    this.createdBy = parsedJson['created_by'];    
    this.date = parsedJson['date'];    
    this.deleted = parsedJson['deleted'];    
    this.gender = parsedJson['gender'];    
    this.id = parsedJson['id'];    
    this.jobType = parsedJson['job_type'];    
    this.lastUpdatedBy = parsedJson['last_updated_by'];    
    this.mail = parsedJson['mail'];    
    this.name = parsedJson['name'];    
    this.password = parsedJson['password'];    
    this.phone = parsedJson['phone'];    
    this.photo = parsedJson['photo'];    
    this.status = parsedJson['status'];    
    this.verified = parsedJson['verified'];    
  }
}