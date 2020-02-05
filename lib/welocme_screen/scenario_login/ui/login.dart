import 'package:dr_booking_flu/welocme_screen/scenario_login/model/text_input.dart';
import 'package:dr_booking_flu/welocme_screen/scenario_registration/ui/sign_up.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/animation_widget.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/text_field_widget.dart';
import 'package:dr_booking_flu/welocme_screen/widgets/welcome_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    SystemChrome.setEnabledSystemUIOverlays([]);
    return login_state();
  }
}

class login_state extends State<login> {

  var key = GlobalKey <FormState>();

  //SOMETHING LIKE ID USING TO GET TEXT FROM FIELD
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final text_input textInput = Provider.of<text_input>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            Form(
              key: key,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * .5 / 10,
                    child: AutoSizeText(
                      "مرحبا بعودتك!",
                      style: TextStyle(
                          fontSize: 30.0, fontFamily: 'thesansbold'),
                    ),
                  ),
                  Image.asset(
                      "images/medicc.png", width: MediaQuery.of(context).size.width*2/3, height: MediaQuery
                      .of(context)
                      .size
                      .height * 3 / 10,
                  fit: BoxFit.cover,),
                  Container(
                    margin: EdgeInsets.only(right: 40.0, left: 40.0),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 2.8 / 10,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: text_field_widget(
                              'البريد الالكترونى', Icons.email, textInput.icon,emailController),
                          flex: 1,
                        ),
                        Expanded(
                          child: Center(
                              child: text_field_widget(
                                  'كلمة السر', Icons.lock, textInput.supicon,passController)),
                          flex: 2,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: AutoSizeText(
                              "نسيت كلمة السر؟",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Theme
                                      .of(context)
                                      .primaryColor),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          flex: 1,
                        ),
                        Expanded(
                          child: welcome_button("تسجيل دخول",emailController.text,passController.text,null,null,1),
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30.0, left: 30.0),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 3 / 10,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AutoSizeText(
                            "لا املك حساب؟",
                            style: TextStyle(
                                fontSize: 15.0, color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: GestureDetector(
                              onTap: ()
                              {
                                Navigator.push(context, MaterialPageRoute(
                                    builder: (context)
                                    {
                                      return sign_up();
                                    }
                                ));
                              },
                              child: AutoSizeText(
                                "تسجيل حساب",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
