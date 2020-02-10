import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/all_docsDoctor.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/all_docsRootClass.dart';
import 'package:dr_booking_flu/doctors_pages/widget/doctor_item.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class doctor_list extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: FutureBuilder(
         future: Api_Call().get_all_docs(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
             if(snapshot.data == null)
               {
                 return Container();
               }
             else{
               //GET ALL DATA
               all_docsRootClass rootClass = all_docsRootClass.fromJSON(snapshot.data);
               all_docsDoctor doctors;
               List<all_docsDoctor> all_docs = List<all_docsDoctor>();


               for(int index=0; index<rootClass.doctors.length ;index++)
                 {
                   doctors  = all_docsDoctor.fromJSON(rootClass.doctors[index]);
                   all_docs.add(doctors);
                 }

               return  Padding(
                 padding: const EdgeInsets.only(bottom:20.0),
                 child: ListView.builder( itemBuilder: (BuildContext context, index)
                 {return Padding(
                     padding: const EdgeInsets.only(top:20.0),
                     child: doctor_item(all_docs[index].name,all_docs[index].description,all_docs[index].address,all_docs[index].price,all_docs[index].image),
                   );
                 }
                 ,itemCount: rootClass.doctors.length,
                 ),
               );
             }
          }
      ),
    );
  }

}