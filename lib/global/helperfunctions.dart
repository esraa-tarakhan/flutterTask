import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions{

  static String sharedPreferenceUserLoggedInKey ="ISLOGGEDIN";


  static String sharedPreferenceUserNameKey ="USERNAMEKEY";
  static String sharedPreferenceUserEmailKey ="USEREMAILKEY";
  static String sharedPreferenceUserIdKey ="USEREIDKEY";


//saving data to shared preference

 static Future<bool> saveUserLoggedInSharedPreference(bool isUserLoggedIn) async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   return await preferences.setBool(
       sharedPreferenceUserLoggedInKey, isUserLoggedIn);
 }


 static Future<bool> saveUserNameSharedPreference(
     String userName) async {
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   return await sharedPreferences.setString(sharedPreferenceUserNameKey,userName);
 }


  static Future<bool> saveUserEmailSharedPreference(
      String userEmail) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setString(sharedPreferenceUserEmailKey,userEmail);
  }





  static Future<String?> getUserNameSharedPreference(
      ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getString(sharedPreferenceUserNameKey);
  }


  static Future<String?> getUserEmailSharedPreference(
      ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return  sharedPreferences.getString(sharedPreferenceUserEmailKey);
  }


}










