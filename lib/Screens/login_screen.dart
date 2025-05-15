import 'package:firebase_practice/Screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Components/mybutton.dart';
import '../Components/mytextfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController txt1 = TextEditingController();
  final TextEditingController txt2 = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> _login() async{
if(_formkey.currentState!.validate()){
print("Hello");
}
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen "), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Mytextfield(
                      name: "Email",
                      textEditingController: txt1,
                      hintext: "Enter Email here",
                      validator:(value) {
                        if (value!.isEmpty) {
                          return "Enter Corrrect email";
                        } return null;
                      },),
                    SizedBox(height: 15),
                  Mytextfield(
                    name: "Password",
                  textEditingController: txt2,
                  hintext: "Enter Email here",
                    validator: (value)=>value!.length <6 ?
                      "Enter 6 digit password" : null,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Mybutton(name: "login",
                      ontap: _login,
                      ),
                    ),
                  Row(
                    children: [
                      Text("If you dont have Acoount"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()),);
                      }, child: Text("signup"))
                    ],
                  )
                  
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

