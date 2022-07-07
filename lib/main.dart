
import 'package:flutter/material.dart';
import 'package:flutter_codigo_sp/pages/home_page.dart';
import 'package:flutter_codigo_sp/utils/shared_global.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SharedGlobal preference = SharedGlobal();
  preference.initSharedPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shared Preferences App",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
