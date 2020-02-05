class Apiclient{

  /**
   * DOMAIN NAME
   */
  static String Base_url="https://webdesign.be4em.info/rosto_api_ar/";

  static String User_Name="549834453";
  static String Pass_Word="25598";

  /**
   * ALL URL
   */

  static String login = '${Base_url}User/login/${User_Name}/${Pass_Word}';

  static String sign_up = '${Base_url}User/register/${User_Name}/${Pass_Word}';

}