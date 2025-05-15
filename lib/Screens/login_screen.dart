import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController txt1 = TextEditingController();
  final TextEditingController txt2 = TextEditingController();
  final _formkey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Screen "), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Login here")),
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: txt1,
                      decoration: _inputDecoration("Email", 'Enter Email here'),
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      controller: txt2,
                      decoration: _inputDecoration(
                        "Password",
                        'Enter Password here',
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                          
                          child: Center(child: Text("Login ")),
                          height: 50,
                          width: double.infinity,
                          
                          decoration: BoxDecoration(color: Colors.grey,
                            borderRadius: BorderRadius.circular(12)
                          
                          ),
                        ),
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

InputDecoration _inputDecoration(String name, hinttext) {
  return InputDecoration(
    labelText: name,
    filled: true,
    focusColor: Colors.black,
    hintText: hinttext,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.black),
    ),
  );
}
