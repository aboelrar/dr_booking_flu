import 'package:dr_booking_flu/doctors_pages/Scenario_doctor_details/ui/doctor_details.dart';

class Apiclient{

  /**
   * DOMAIN NAME
   */
  static String Base_url="http://drbookingsa.com/renova_en/";

  static String User_Name="54732964";
  static String Pass_Word="259743";

  /**
   * ALL URL
   */

  static String login = '${Base_url}User/login/${User_Name}/${Pass_Word}';

  static String sign_up = '${Base_url}User/register/${User_Name}/${Pass_Word}';

  static String get_all_doctors = '${Base_url}Doctor/getAll/${User_Name}/${Pass_Word}/1';

  static String get_search_doctors = '${Base_url}Search/index/${User_Name}/${Pass_Word}';

  static String doctor_details = '${Base_url}Doctor/view/$User_Name/$Pass_Word';

  static String doctor_search = '${Base_url}Doctor/getAll/$User_Name/$Pass_Word';

  static String doctor_myfav = '${Base_url}User/getFavoriteDoctors/$User_Name/$Pass_Word';

  static String doctor_myappoienments = '${Base_url}User/view_reservations/$User_Name/$Pass_Word';

  static String edit_profile = '${Base_url}user/editProfile/$User_Name/$Pass_Word';

  static String Add_fav = '${Base_url}User/addFavoriteDoctor/$User_Name/$Pass_Word';

  static String Delete_fav = '${Base_url}User/deleteFavoriteDoctor/$User_Name/$Pass_Word';

  static String Make_reservation = '${Base_url}User/make_reservation/$User_Name/$Pass_Word';

}