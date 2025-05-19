import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_practice/Screens/add_posts.dart';
import 'package:firebase_practice/Screens/splash_screen.dart';
import 'package:firebase_practice/uitils/tostmessae.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchCtrl = TextEditingController();
  final updateCtrl = TextEditingController();
  String searchquery = '';

  FirebaseAuth auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Posts');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.green.shade100,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              auth.signOut().then((value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SplashScreen()),
                );
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPosts()),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    searchquery = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'search',
                  border: OutlineInputBorder(),
                  hoverColor: Colors.grey.shade50,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                stream: ref.onValue,
                builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                  if(!snapshot.hasData || snapshot.data!.snapshot.value == null){
                    return Center(child: Text("NO Data Found"),);
                  }else {
                    Map<dynamic, dynamic> map =
                    snapshot.data!.snapshot.value as dynamic;
                    List<dynamic> list = [];
                    list.clear();
                    list = map.values.toList();
                    List<dynamic> filteredList =
                    list.where((item) {
                      final details = item['details'].toString().toLowerCase();
                      return details.contains(searchquery);
                    }).toList();

                    return ListView.builder(
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        String val = filteredList[index]['details'].toString();
                        String id = filteredList[index]['id'].toString();
                        return ListTile(
                          title: Text(
                              filteredList[index]['details'].toString()),
                          subtitle: Text(filteredList[index]['id'].toString()),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.edit),
                            itemBuilder:
                                (context) =>
                            [
                              PopupMenuItem(
                                child: ListTile(
                                  title: Text('Edit'),
                                  onTap: () {
                                    Showmydailog(val, id);
                                  },
                                ),
                              ), PopupMenuItem(
                              child: ListTile(
                                title: Text('Delete'),
                                onTap: () {
                                  setState(() {

                                  });
                                  ref.child(id).remove().then((value) {
                                    tostmsg().message(
                                        "Data delete Successfully ");
                                  });
                                },
                              ),
                            ),
                            ],
                          ),
                        );
                      },
                    );
                  } },
              )
              //  child: FirebaseAnimatedList(
              // query: ref,
              // itemBuilder: (context,snapshot,animation,index,){
              //   return Container(
              //     height: 100,
              //     child: Card(
              //
              //       color: Colors.deepPurple.shade50,
              //
              //       child:  Center(child: Text(snapshot.child('details').value.toString())),
              //
              //     ),
              //   );/
              // }),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> Showmydailog( String details,id) async {
    updateCtrl.text=details;
    print(details);
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: Container(
            child: TextField(
              controller: updateCtrl,
              decoration: InputDecoration(

                hintText: "",
              ),
            ),
          ),
          title: Text("Update data"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ref.child(id).update({
                  'details': updateCtrl
                })        ;

              },
              child: Text("Update"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancle"),
            ),
          ],
        );
      },
    );
  }
}
