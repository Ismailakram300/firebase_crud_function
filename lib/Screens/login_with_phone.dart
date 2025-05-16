import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_practice/Screens/verification_sms.dart';
import 'package:firebase_practice/uitils/tostmessae.dart';
import 'package:flutter/material.dart';

import '../Components/mybutton.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  final TextEditingController PhoneVerificationCtrl = TextEditingController();
final FirebaseAuth auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Login with Phone")),

    body: Column(

      children: [
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: TextFormField(
            controller: PhoneVerificationCtrl,
keyboardType: TextInputType.number,
            decoration: InputDecoration(

              hintText: "Enter your num here",
            ),
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Mybutton(
            name: "Verify",
            ontap: (){
             // Navigator.push(context,MaterialPageRoute(builder: (context)=> L));
              auth.verifyPhoneNumber(
                phoneNumber: PhoneVerificationCtrl.text,
                  verificationCompleted:(_){} ,
                  verificationFailed: (e){
                    tostmsg().message(e.toString());

                  },
                  codeSent: (String verificationId, int? token){
Navigator.push(context, MaterialPageRoute(builder: (context)=> VerificationSms(VerificationId: verificationId,)));
                  },
                  codeAutoRetrievalTimeout: (e){
                  tostmsg().message(e.toString());
                  });
            },
            isloading: false,
          ),
        ),
      ],    ),
    );
  }
}
