import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Screens/home_page.dart';
import 'package:firebase_practice/Screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
void Check(){
  final user=auth.currentUser;
  if(user!=null){
    print(user);
    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()),), );

  }else{
    Timer(Duration(seconds: 3), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()),), );

  }
}
  void initState(){
    super.initState();
    Check();
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
