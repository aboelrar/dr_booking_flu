import 'package:dr_booking_flu/welocme_screen/scenario_login/model/welcome_tour_model.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/drawer_paint.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/on_boarding_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

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
      body: Stack(
        children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageIndicatorContainer(
                    child: PageView.builder(
                      itemCount: arraylist.length,
                      itemBuilder: (context, index) {
                        return on_boarding_item(arraylist[index].page_name,
                            arraylist[index].image, arraylist[index].descripition);
                      },
                    ),
                    align: IndicatorAlign.bottom,
                    length: 3,
                    indicatorSpace: 20.0,
                    padding: const EdgeInsets.all(20),
                    indicatorColor: Colors.grey,
                    indicatorSelectorColor: Theme.of(context).primaryColor,
                    shape: IndicatorShape.circle(size: 12),
                  ),
              ),
              
            ],
          ),
        ),
          Align(
            alignment: Alignment.centerRight,
            child: CustomPaint(
                  painter: DrawerPaint(
                    curveColor: Colors.blue,
                  ),
                  child: Container(
                    width: 50,
                    height: double.infinity,
                  ),
                )

            ),
      ]
      ),
    );
  }
}
