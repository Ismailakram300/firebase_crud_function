import 'package:firebase_practice/Components/mybutton.dart';
import 'package:firebase_practice/Components/mytextfield.dart';
import 'package:flutter/material.dart';

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
  Future<void> _signup() async {
    if (_formkey.currentState!.validate()) {
      print("Form  valid");

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
              Mytextfield(
                textEditingController: _nameCtr,
                name: "Name",
                hintext: "Enter your Name",
                validator: (value) => value!.isEmpty ?
                "Enter value": null
                ,
              ),
              SizedBox(height: 15),
              Mytextfield(
                textEditingController: _emailCtr,
                name: "Email",
                hintext: "Enter your Email",
                validator: (value) => value!.isEmpty ?
                "Enter value": null
                ,
              ),
              SizedBox(height: 15),
              Mytextfield(
                textEditingController: _passwordCtr,
                name: "Password",
                hintext: "Enter your password",
                validator: (value) => value!.isEmpty ?
                "Enter value": null
                ,
              ),
              SizedBox(height: 15),
              Mybutton(name: "Signup", ontap: _signup),
            ],
          ),
        ),
      ),
    );
  }
}
