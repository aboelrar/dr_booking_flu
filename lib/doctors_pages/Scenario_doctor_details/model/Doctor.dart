//
//  Doctor.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 15, 2020

class Doctor {  
  String address;
  var description;
  int favorite;    
  String id;    
  String doctor_id;
  String image;
  var jobTitle;
  var latitude;
  var longitude;
  String name;
  var price;
  var rating;

  Doctor.fromJSON(Map<String, dynamic> parsedJson) {    
    this.address = parsedJson['address'];    
    this.description = parsedJson['description'];    
    this.favorite = parsedJson['favorite'];    
    this.id = parsedJson['id'];    
    this.doctor_id = parsedJson['doctor_id'];
    this.image = parsedJson['image'];
    this.jobTitle = parsedJson['job_title'];    
    this.latitude = parsedJson['latitude'];    
    this.longitude = parsedJson['longitude'];    
    this.name = parsedJson['name'];    
    this.price = parsedJson['price'];    
    this.rating = parsedJson['rating'];    
  }
}