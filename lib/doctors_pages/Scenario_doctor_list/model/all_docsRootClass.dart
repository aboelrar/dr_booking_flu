//
//  all_docsRootClass.dart
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on February 8, 2020

import 'all_docsDoctor.dart';

class all_docsRootClass {
  List<dynamic> doctors;
  int status;    

  all_docsRootClass.fromJSON(Map<String, dynamic> parsedJson) {
    this.doctors = parsedJson['doctors'];    
    this.status = parsedJson['status'];    
  }
}