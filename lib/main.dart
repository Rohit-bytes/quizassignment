import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:quizassignment/homepage.dart';

void main(){

  runApp(app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
debugShowCheckedModeBanner: false,
      home: Homepage(),
    );}}