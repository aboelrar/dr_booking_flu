//
//  root_doc_details.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 15, 2020

import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/model/Doctor.dart';

class root_doc_details {
  var dates;
  var doctor;
  var status;

  root_doc_details.fromJSON(Map<String, dynamic> parsedJson) {
    this.dates = parsedJson['dates'];    
    this.doctor = parsedJson['doctor'];    
    this.status = parsedJson['status'];    
  }
}