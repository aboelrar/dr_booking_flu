//
//  all_docsDoctor.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 8, 2020

class all_docsDoctor {  
  String address;
  String description;
  int favorite;
  String id;
  String doctor_id;
  String image;
  String jobTitle;
  String latitude;
  String longitude;
  String name;
  String price;
  var rating;
  var rate;

  all_docsDoctor.fromJSON(Map<String, dynamic> parsedJson) {    
    this.address = parsedJson['place'];
    this.description = parsedJson['description'];
    this.favorite = parsedJson['favorite'];
    this.id = parsedJson['id'];
    this.doctor_id = parsedJson['doctor_id'];
    this.image = parsedJson['image'];
    this.jobTitle = parsedJson['job_title'];
    this.latitude = parsedJson['latitude'];
    this.longitude = parsedJson['longitude'];
    this.name = parsedJson['doctor'];
    this.price = parsedJson['price'];
    this.rating = parsedJson['rating'];
    this.rate = parsedJson['rate'];

  }
}