import 'package:firebase_practice/Components/mybutton.dart';
import 'package:flutter/material.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final TextEditingController text1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Add Posts here"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              controller: text1,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "What si in your mindd",
                border: OutlineInputBorder(),

              ),
            ),
          ),
          SizedBox(height: 30,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Mybutton(name: "Submit", ontap: (){

            }),
          )
        ],
      ),
    ); }
}
