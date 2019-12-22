import 'package:shared_preferences/shared_preferences.dart';

class UserStore {

  //Getters

  Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("useremail");
  }
  
  Future<String> getUserPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get("password");
  }

  //Setters

  Future setUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("useremail", userEmail);
  }

    Future setUserPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("password", password);
  }
}