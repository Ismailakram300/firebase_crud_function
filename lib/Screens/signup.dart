import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Components/mybutton.dart';

import 'package:firebase_practice/Components/mytextfield.dart';

import 'package:firebase_practice/Screens/login_screen.dart';

import 'package:flutter/material.dart';

import '../uitils/tostmessae.dart';

class Signup extends StatefulWidget {
  
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameCtr = TextEditingController();
  final TextEditingController _emailCtr = TextEditingController();
  final TextEditingController _passwordCtr = TextEditingController();
  final _formkey = GlobalKey<FormState>();
   bool _isloading =false;
FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _signup() async {

    if (_formkey.currentState!.validate()) {
      setState(() {
        _isloading=true;
      });
try{
  await auth.createUserWithEmailAndPassword(
    email: _emailCtr.text.toString(),
    password: _passwordCtr.text.toString(),

  );
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
  );
setState(() {
  _isloading =false;
});
  tostmsg().message("Signup Successfully");
} catch (e){
  setState(() {

  });
  tostmsg().message(e.toString());
setState(() {
  _isloading=false;
});
}

    } else {
      print("Form not valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Signup Here ",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50 ),),
              SizedBox(height: 30,),
              Mytextfield(
                icon: Icon(Icons.nat),
                textEditingController: _nameCtr,
                name: "Name",
                hintext: "Enter your Name",
                validator: (value) => value!.isEmpty ?
                "Enter value": null
                ,
              ),
              SizedBox(height: 15),
              Mytextfield(
                icon: Icon(Icons.alternate_email),
                textEditingController: _emailCtr,
                name: "Email",
                hintext: "Enter your Email",
                validator: (value) => value!.isEmpty ?
                "Enter value": null
                ,
              ),
              SizedBox(height: 15),
              Mytextfield(
                icon: Icon(Icons.password),

                textEditingController: _passwordCtr,
                name: "Password",
                hintext: "Enter your password",
                validator: (value) => value!.isEmpty ?
                "Enter value": null
                ,
              ),
              SizedBox(height: 15),
              Mybutton(name: "Signup", ontap: _signup,isloading: _isloading,),
              SizedBox(height: 15),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text("If you Already have Acoount"),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()),);
                    }, child: Text("login"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
