import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Screens/home_page.dart';
import 'package:firebase_practice/Screens/signup.dart';
import 'package:firebase_practice/uitils/tostmessae.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

import '../Components/mybutton.dart';
import '../Components/mytextfield.dart';
import 'login_with_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController txt1 = TextEditingController();
  final TextEditingController txt2 = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async{
if(_formkey.currentState!.validate()){
try {
  await _auth.signInWithEmailAndPassword(email: txt1.text, password: txt2.text).then((value){

Navigator.push(context,MaterialPageRoute(builder: (context)=> HomePage()));
  }).onError((error, stackTrace)  {
   tostmsg().message(error.toString());
  });
} catch (e){

}
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
Text("Login Here ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50 ),),
            SizedBox(height: 30,),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Mytextfield(
                      icon: Icon(Icons.lock),
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
                    icon: Icon(Icons.alternate_email),
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
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("If you dont have Acoount"),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()),);
                        }, child: Text("signup"))
                      ],
                    ),
                  ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>  LoginWithPhone()));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey,
borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.black)
                        ),
                        child: Center(child: Text("Signup with phone ")),
                      ),
                    ),
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

