import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final referceDatabase = FirebaseDatabase.instance;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  final key = GlobalKey();

  final DBRef=FirebaseDatabase.instance.reference();

  void writedata(){
    DBRef.child("FullName").push().set({
      'FirstName':firstNameController.text,
      'SecondName':secondNameController.text
    });
  }

  void readData(){
    DBRef.once().then((DataSnapshot snapshot) {
      print(snapshot.value);
    });
  }

  void update(){
    DBRef.child('FullName').push().update({
      'FirstName':firstNameController.text,
      'SecondName':secondNameController.text
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: SingleChildScrollView(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'First Name'
                              ),
                              controller: firstNameController,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Second Name'
                              ),
                              controller: secondNameController,
                            ),
                          ],
                        ),
                      ),
                      RaisedButton(
                        splashColor: Colors.indigo,
                        onPressed: () {
                          writedata();
                          firstNameController.clear();
                        },
                        child: Text('Create'),
                      ),
                      RaisedButton(
                        splashColor: Colors.indigo,
                        onPressed: () {
                          readData();
                        },
                        child: Text('read'),
                      ),
                      RaisedButton(
                        splashColor: Colors.indigo,
                        onPressed: () {

                        },
                        child: Text('update'),
                      ),
                      RaisedButton(
                        splashColor: Colors.indigo,
                        onPressed: () {
                          writedata();
                        },
                        child: Text('delete'),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
