import 'package:flutter/material.dart';
import 'package:terserah/edit_profile.dart';
import 'package:terserah/profile.dart';
import 'package:terserah/sign_in.dart';
import 'splash_screen.dart';
import 'package:terserah/preference.dart';
import 'package:terserah/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Helvetica',
      ),
      home: SplashScreen(),
      routes:{
        '/preferencestart':(context)=>MyAppPreference(),
        '/home': (context)=> MyAppHome(),
        '/profile': (context)=> MyAppProfile(),
      },
    );
  }
}
