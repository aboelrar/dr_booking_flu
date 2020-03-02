import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/scenario_search/ui/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class skip extends StatelessWidget{

  var CS;
  var gravity;

  skip(this.CS,this.gravity);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: gravity,
          textDirection: TextDirection.ltr,
          children: <Widget>[
            GestureDetector(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)
                    {
                      return CS;
                    }
                ));
              },
              child: AutoSizeText(
                "تخطى",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontFamily: 'thesansbold'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:3.0),
              child: Icon(Icons.arrow_back,color: Theme.of(context).primaryColor,),
            )
          ],
        ),
      ),
    );
  }

}