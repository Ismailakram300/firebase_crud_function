import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
        backgroundColor: Colors.green.shade100,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: (){
              auth.signOut().then((value){
                Navigator.push(context,MaterialPageRoute(builder:(context)=> SplashScreen()));
              });
            },
          ),

        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Posts")
          ],
        ),
      ),
    );
  }
}
