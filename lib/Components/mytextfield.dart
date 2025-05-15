import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  TextEditingController textEditingController= TextEditingController();
  final String name,hintext;
  final String? Function(String?)? validator;
   Mytextfield({
     this.validator,
     required this.textEditingController, required this.name, required this.hintext});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration:InputDecoration(
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
