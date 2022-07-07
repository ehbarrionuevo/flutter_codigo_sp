import 'package:flutter/material.dart';
import 'package:flutter_codigo_sp/utils/shared_global.dart';
import 'package:flutter_codigo_sp/widgets/my_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final SharedGlobal _sharedGlobal = SharedGlobal();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool isDarkMode = false;
  int gender = 1;

  saveSharedPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString("fullName", _fullNameController.text);
    _prefs.setString("address", _addressController.text);
    _prefs.setBool("darkMode", isDarkMode);
    _prefs.setInt("gender", gender);
    print("Guardando en shared preferences...");
  }

  save2(){
    _sharedGlobal.fullName = _fullNameController.text;
    _sharedGlobal.gender = gender;
  }


  getDataSharedPreferences() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String fullName = _prefs.getString("fullName") ?? "-";
    String address = _prefs.getString("address") ?? "-";
    print(fullName);
    print(address);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences App"),
      ),
      drawer: MyDrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Configuración General",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextField(
                controller: _fullNameController,
                decoration: InputDecoration(hintText: "Nombre completo"),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(hintText: "Dirección actual"),
              ),
              const SizedBox(
                height: 12.0,
              ),
              // Switch(
              //   value: false,
              //   onChanged: (bool value) {},
              // ),
              SwitchListTile(
                value: isDarkMode,
                title: Text("Modo Oscuro"),
                onChanged: (bool value) {
                  isDarkMode = value;
                  print(isDarkMode);
                  setState(() {});
                },
              ),

              // Radio(
              //   value: 1,
              //   groupValue: 1,
              //   onChanged: (int? value) {},
              // ),

              RadioListTile(
                value: 1,
                groupValue: gender,
                title: Text("Masculino"),
                onChanged: (int? value) {
                  gender = value!;
                  print(gender);
                  setState(() {});
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: gender,
                title: Text("Femenino"),
                onChanged: (int? value) {
                  gender = value!;
                  print(gender);
                  setState(() {});
                },
              ),

              const SizedBox(
                height: 20.0,
              ),

              SizedBox(
                width: double.infinity,
                height: 54.0,
                child: ElevatedButton.icon(
                  onPressed: (){
                    save2();
                    // saveSharedPreferences();
                    //getDataSharedPreferences();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  icon: Icon(Icons.save, color: Colors.white,),
                  label: Text("Guardar Data"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
