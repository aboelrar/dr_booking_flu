import 'package:auto_size_text/auto_size_text.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/widget/dialog_loading.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/model/doctors_url.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/ui/doctor_list.dart';
import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_list/widget/dialog_loading_filter.dart';
import 'package:dr_booking_flu/network_layer/Api_Call.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class filter extends StatelessWidget {
  var search_txt = 'rate';
  var text_is,text_name;

  filter(this.search_txt);

  @override
  Widget build(BuildContext context) {

    final doctors_url doctors_method_api = Provider.of<doctors_url>(context);

    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
          right: MediaQuery.of(context).size.width * .2 / 4,
          left: MediaQuery.of(context).size.width * .2 / 4,top: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: ()
            {
              doctors_method_api.set_flag(1); //SET FLAG ONE TO MAKE DIALOG WORK

              var doctor_method = Api_Call()
                  .get_all_docs_search(search_txt, 'rate'); //GET ALL DOCTORS FILTERD
              doctors_method_api.set_method(doctor_method); //SET DATA TO PROVIDER

              dialog_loading_filter().loading(context,search_txt); //START WORKING DIALOG

            

              text_is = 'rate';
              doctor_list.status = 'rate';


              doctors_method_api.set_RateColors();  //SET COLOR SELECTED
              //SET ALL COLORS UNSELECTED
              doctors_method_api.set_LpriceDefult();
              doctors_method_api.set_HpriceDefult();



            },
            child: Container(
              width: MediaQuery.of(context).size.width * 1.1 / 4,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color : doctors_method_api.bgColorRate,
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                ],
              ),
              child: Center(
                  child: AutoSizeText(
                    'الاعلى تقييم',
                    style: TextStyle(
                        color: doctors_method_api.textColorRate,
                        fontFamily: 'thesansbold',
                        fontSize: 15.0),
                  ),
                ),
              ),
          ),
          GestureDetector(
            onTap: ()
            {
              doctors_method_api.set_flag(1); //SET FLAG ONE TO MAKE DIALOG WORK

              var doctor_method = Api_Call()
                  .get_all_docs_search(search_txt, 'price_desc'); //GET ALL DOCTORS FILTERD
              doctors_method_api.set_method(doctor_method); //SET DATA TO PROVIDER

              dialog_loading_filter().loading(context,search_txt); //START WORKING DIALOG

              doctors_method_api.set_HpriceColors();  //SET COLOR SELECTED
              //SET ALL COLORS UNSELECTED
              doctors_method_api.set_LpriceDefult();
              doctors_method_api.set_RateDefult();

              text_is = 'price_desc';
              doctor_list.status = 'price_desc';




            },
            child: Container(
              width: MediaQuery.of(context).size.width * 1.1 / 4,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: doctors_method_api.bgColorHprice,
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                ],
              ),
              child: Center(
                child: AutoSizeText(
                  'الاعلى سعر',
                  style: TextStyle(
                      color: doctors_method_api.textColorHprice,
                      fontFamily: 'thesansbold',
                      fontSize: 15.0),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: ()
            {
              doctors_method_api.set_flag(1); //SET FLAG ONE TO MAKE DIALOG WORK

              var doctor_method = Api_Call()
                  .get_all_docs_search(search_txt, 'price_asc'); //GET ALL DOCTORS FILTERD
              doctors_method_api.set_method(doctor_method); //SET DATA TO PROVIDER

              dialog_loading_filter().loading(context,search_txt); //START WORKING DIALOG

              doctors_method_api.set_LpriceColors();  //SET COLOR SELECTED
              //SET ALL COLORS UNSELECTED
              doctors_method_api.set_HpriceDefult();
              doctors_method_api.set_RateDefult();

              text_is = 'price_asc';
              doctor_list.status = 'price_asc';



            },
            child: Container(
              width: MediaQuery.of(context).size.width * 1.1 / 4,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: doctors_method_api.bgColorLprice,
                boxShadow: [
                  BoxShadow(color: Colors.grey, spreadRadius: 1),
                ],
              ),
              child: Center(
                child: AutoSizeText(
                  'الاقل سعر',
                  style: TextStyle(
                      color: doctors_method_api.textColorLprice,
                      fontFamily: 'thesansbold',
                      fontSize: 15.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
