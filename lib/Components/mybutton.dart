import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String name;
  final VoidCallback ontap;
  final bool isloading ;


  Mybutton({
    this.isloading = false, required this.name,required this.ontap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(

        child: isloading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,): Center(child: Text(name)),
        height: 50,
        decoration: BoxDecoration(color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(12)

        ),
      ),
    );
  }
}
