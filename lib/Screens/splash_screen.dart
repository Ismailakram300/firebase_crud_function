import 'dart:async';

import 'package:firebase_practice/Screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()),), );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }

}
