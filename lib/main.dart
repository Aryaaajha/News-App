import 'dart:js';

import 'package:flutter/material.dart';
import 'package:news_app/view/home.dart';
import 'package:news_app/view/splash.dart';



void main() {

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.


  bool ShowingSplash=true;
  LoadHome(){
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        ShowingSplash=false;

      });
    });
}
  @override
  void initState(){
    super.initState();
    LoadHome();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Snack',
      theme: ThemeData(

      ),
      home:ShowingSplash? SplashScreen() : HomeScreen(),
    );
  }
}


