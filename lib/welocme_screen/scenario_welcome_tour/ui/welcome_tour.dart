import 'package:dr_booking_flu/welocme_screen/scenario_login/model/welcome_tour_model.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/on_boarding_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class welcome_tour extends StatelessWidget {
  List<welcome_tour_model> arraylist = new List<welcome_tour_model>();

  @override
  Widget build(BuildContext context) {
    //ADD DATA TO WELCOME TOUR PAGE


    arraylist.add(new welcome_tour_model(
        "images/choose_doc.png",
        "مرحبا بك فى دكتور بوكينق",
        "مع دكتور بوينق تستطيع بسهوله اختار الطبيب المناسب لك"));

    arraylist.add(new welcome_tour_model(
        "images/book_doc.png",
        "احجز موعدك الان",
        "يوفر لك دكتور بوكينق الحجز بسهوله فى الميعاد الذى تحدده اختر الميعاد والطبيب واحجز الان"));

    arraylist.add(new welcome_tour_model(
        "images/selectdoc.png",
        "ابحث الان",
        "تستطيع البحث عن اعراض مرضك بكل سهوله فقط اكتب اسم العرض بحث يظهر لك جميع الاطباء المتخصصين فى هذا المجال"));

    // TODO: implement build
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 9 / 10,
              child: PageView.builder(
                itemCount: arraylist.length,
                itemBuilder: (context, index) {
                  return on_boarding_item(arraylist[index].page_name,
                      arraylist[index].image, arraylist[index].descripition);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
