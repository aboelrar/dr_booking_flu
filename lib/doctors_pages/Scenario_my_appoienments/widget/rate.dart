import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_my_appoienments/widget/line_appoienments.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_my_appoienments/widget/successfull_rating_dialog.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_main_screen/ui/search.dart';
import 'package:dr_booking_flu/doctors_pages/widget/doctor_item.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_splash_screen/ui/splash_screen.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_update_personal_info/widget/line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class rate {
  double rate_num ;
  rate(BuildContext context,String doc_id) {
    showGeneralDialog(context: context,
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (context, anim1, anim2)
         {
          return Padding(
            padding: const EdgeInsets.only(right:20.0,left: 20.0),
            child: Dialog(
              child: Container(
                height: 260,
               child: Column(
                 children: <Widget>[
                   Container(
                     padding: EdgeInsets.only(right: 15.0),
                     height: 50,
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: <Widget>[
                         Image.asset(
                           "images/pencil.png",
                           width: 17,
                           height: 17,
                         ),
                     Padding(
                       padding: const EdgeInsets.only(right: 15.0),
                       child: AutoSizeText(
                         "تقييم الطبيب",
                         style: TextStyle(
                             fontSize: 14.0, fontFamily: 'thesansbold'),
                       ),
                       ),
                       ],
                     ),
                   ),
                   line_appoienments(),
                   Container(
                     height: 100,
                     child: Center(
                       child: (RatingBar(
                         minRating: 1,
                         itemSize: 35.0,
                         direction: Axis.horizontal,
                         allowHalfRating: true,
                         itemCount: 5,
                         itemPadding:
                         EdgeInsets.symmetric(horizontal: 1.0),
                         itemBuilder: (context, _) => Icon(
                           Icons.star,
                           color: Colors.orange,
                         ),
                         onRatingUpdate: (rating) {
                           rate_num  = rating;
                         },
                       )),
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(right:30.0,left: 30.0,bottom: 10.0),
                     child: TextFormField(
                       decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                             borderSide: BorderSide(
                               color: Colors.grey,
                             )),
                         hintText: "اضف ملاحظتك عن الطبيب",hintStyle: TextStyle(fontSize: 14),
                         contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                       ),
                     ),
                   ),
                   FlatButton(
                     color: Colors.deepOrangeAccent,
                     textColor: Colors.white,
                     disabledColor: Colors.grey,
                     disabledTextColor: Colors.black,
                     splashColor: Colors.blueAccent,
                     padding: EdgeInsets.only(right: 30.0, left: 30.0),
                     onPressed: () {

                       Response(rate_num.round(),doc_id,context); //SEND DATA TO SERVER

                     },
                     child: Text(
                       'تقييم',
                       style: TextStyle(fontSize: 15.0),
                     ),
                   )

                 ],
               ),
              )
            ),
          );
        },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position:
          Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },);

  }


  Response(int rating,String doc_id,BuildContext context)
  {
    Api_Call().set_rate(search_state.id,doc_id,rating).then((value){
       if(value['status']==1)
         {
           Navigator.pop(context); //CANCEL DIALOG
           successfull_rating_dialog().success_dialog(context);
         }
    });

  }

}
