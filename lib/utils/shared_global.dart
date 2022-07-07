
import 'package:shared_preferences/shared_preferences.dart';

class SharedGlobal{

  static final SharedGlobal myInstance = SharedGlobal._instance();

  SharedGlobal._instance();

  factory SharedGlobal(){
    return myInstance;
  }

  late SharedPreferences _prefs;

  Future<void> initSharedPreferences() async{
    _prefs = await SharedPreferences.getInstance();
  }

  set fullName(String value){
    _prefs.setString("fullName", value);
  }

  String get fullName {
    return _prefs.getString("fullName") ?? "-";
  }


  set gender(int value){
    _prefs.setInt("gender", value);
  }

  int get gender{
    return _prefs.getInt("gender") ?? 1;
  }







}