import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  TextEditingController textEditingController= TextEditingController();
  final String name,hintext;
  final String? Function(String?)? validator;
final Icon icon;
   Mytextfield({
     this.validator,
     required this.icon,
     required this.textEditingController, required this.name, required this.hintext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: textEditingController,
      decoration:InputDecoration(
        prefixIcon: icon,
        labelText: name,
        filled: true,
        focusColor: Colors.black,
        hintText: hintext,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      validator: validator,
    );
  }
}
