import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:social_media_app/route.dart';
import 'package:social_media_app/screen/HomePage.dart';
void main() {
  runApp(SociallyApp());
}

class SociallyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      home: HomePage(),
           initialRoute: route.GetHomePage(),
      getPages: route.Route,
    );
  }
}




