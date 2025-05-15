import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String name;
  final VoidCallback ontap;


  Mybutton({required this.name,required this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(

        child: Center(child: Text(name)),
        height: 50,
        decoration: BoxDecoration(color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(12)

        ),
      ),
    );
  }
}
