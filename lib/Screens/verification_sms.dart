import 'package:firebase_practice/Components/mybutton.dart';
import 'package:flutter/material.dart';

class VerificationSms extends StatefulWidget {
  final String VerificationId;
  const VerificationSms({Key? key, required this.VerificationId}): super(key: key) ;

  @override
  State<VerificationSms> createState() => _VerificationSmsState();
}

class _VerificationSmsState extends State<VerificationSms> {
  final TextEditingController SmsVerificationCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Login with Phone")),

      body: Column(

        children: [
          SizedBox(height: 13,),
TextFormField(
  controller: SmsVerificationCtrl,

  decoration: InputDecoration(
hintText: "Enter your num here",
  ),
),

        ],    ),
    );
  }
}
