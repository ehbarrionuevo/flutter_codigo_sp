import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_codigo_sp/utils/shared_global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfilePage extends StatefulWidget {
  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  final SharedGlobal _sharedGlobal = SharedGlobal();

  String fullName = "";
  String address = "";

  @override
  initState() {
    super.initState();
    getDataShared();
  }

  getDataShared() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    fullName = _prefs.getString("fullName") ?? "-";
    address = _prefs.getString("address") ?? "-";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Mi información",
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                _sharedGlobal.fullName,
              ),
              subtitle: Text("Nombre completo"),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text(address),
              subtitle: Text("Dirección"),
            ),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text("Activo"),
              subtitle: Text("Modo Oscuro"),
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Masculino"),
              subtitle: Text("Género"),
            ),
          ],
        ),
      ),
    );
  }
}
