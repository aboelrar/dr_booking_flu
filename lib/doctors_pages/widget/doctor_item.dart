import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class doctor_item extends StatelessWidget {

  String doc_name;

  doctor_item(this.doc_name);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(

      margin: EdgeInsets.only(right: 20.0, left: 20.0),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(5.0),
        height: MediaQuery.of(context).size.height * 2.2 / 10,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRxm6IYuV69PF3j3fXIR0wcdRpzM4l3K1GMmE_m1wKJSS8jjW6d",
                          width: MediaQuery.of(context).size.width * 2.5 / 10,
                          height: MediaQuery.of(context).size.height * 1.3 / 10,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * .9 / 10,
                        width: MediaQuery.of(context).size.width * 2.5 / 10,
                        height: MediaQuery.of(context).size.height * .4 / 10,
                        child: Container(
                          decoration: new BoxDecoration(
                              color: const Color(0xff40000000),
                              borderRadius: new BorderRadius.only(
                                  bottomRight: const Radius.circular(10.0),
                                  bottomLeft: const Radius.circular(10.0))),
                          child: Center(
                            child: (RatingBar(
                              initialRating: 5,
                              minRating: 1,
                              itemSize: 17.0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
                    height: MediaQuery.of(context).size.height * 1.3 / 10,
                    width: MediaQuery.of(context).size.width * 5.5 / 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(
                          'دكتور محمد القفل',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
                              fontFamily: 'thesansbold'),
                        ),
                        AutoSizeText(
                          "استشارى جراحة تجميل",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontFamily: 'thesansbold'),
                        ),
                        AutoSizeText(
                          "طريق الملك عبدالعزيز الرياض السعوديه",
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 11.0,
                              fontFamily: 'thesansbold'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: const Color(0xff26000000),
                    ),
                    width: 25,
                    height: 25,
                    child: Icon(
                      Icons.favorite,
                      size: 15.0,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .2 / 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .01 / 10,
              color: const Color(0xff1A000000),
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0,left: 10.0),
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[

                  Container(
                    width: MediaQuery.of(context).size.width * .9/ 2,
                    height: MediaQuery.of(context).size.height * .5 / 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          size: 18,
                        ),
                        AutoSizeText(
                          "300 ريال",
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.0,
                              fontFamily: 'thesansbold'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .5 / 2,
                    height: MediaQuery.of(context).size.height * .5 / 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.place,
                          size: 18,
                          color: Colors.blue,
                        ),
                        AutoSizeText(
                          "رؤية الخريطة",
                          maxLines: 1,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12.0,
                              fontFamily: 'thesansbold'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
