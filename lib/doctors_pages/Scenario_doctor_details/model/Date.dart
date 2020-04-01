//
//  Date.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on March 21, 2020

class Date {  
  String created;    
  String createdBy;    
  String deleted;    
  String fromTime;    
  String id;    
  String idUser;    
  String lastUpdatedBy;    
  String place;    
  String reservationDate;    
  String status;    
  String toTime;    
  String updatedAt;    

  Date.fromJSON(Map<String, dynamic> parsedJson) {    
    this.created = parsedJson['created'];    
    this.createdBy = parsedJson['created_by'];    
    this.deleted = parsedJson['deleted'];    
    this.fromTime = parsedJson['from_time'];    
    this.id = parsedJson['id'];    
    this.idUser = parsedJson['id_user'];    
    this.lastUpdatedBy = parsedJson['last_updated_by'];    
    this.place = parsedJson['place'];    
    this.reservationDate = parsedJson['reservation_date'];    
    this.status = parsedJson['status'];    
    this.toTime = parsedJson['to_time'];    
    this.updatedAt = parsedJson['updatedAt'];    
  }
}