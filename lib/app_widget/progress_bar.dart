import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class progress_bar {

  progress_bar_loading(BuildContext context)
  {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('images/all_docs_loading.png',width: 100,height: 100,),
            Loading(indicator: BallPulseIndicator(), size: 70.0,color: Theme.of(context).primaryColor)
          ],
        )
      ),
    );
  }

}