import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_practice/Components/mybutton.dart';
import 'package:firebase_practice/uitils/tostmessae.dart';
import 'package:flutter/material.dart';

class AddPosts extends StatefulWidget {
  const AddPosts({super.key});

  @override
  State<AddPosts> createState() => _AddPostsState();
}

class _AddPostsState extends State<AddPosts> {
  final ref = FirebaseDatabase.instance.ref("Posts");
  final TextEditingController text1 = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Posts here"), centerTitle: true),
      body: Column(
        children: [
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: TextFormField(
              controller: text1,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "What si in your mind",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Mybutton(
              isloading: isloading,
              name: "Submit",
              ontap: () {
                String id=DateTime.now().millisecondsSinceEpoch.toString();
                setState(() {
                  isloading = true;
                });
                ref
                  .child(id)
                  .set({
                    'id': id,
                  'details': text1.text.toString(),
                  })
                  .then((value) {
                    tostmsg().message("Submission Successfully");
                    setState(() {
                      isloading = false;
                    });
                  }).onError((error, stack) {
                  tostmsg().message(error.toString());

                  setState(() {
                    isloading = false;
                  });
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
