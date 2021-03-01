import 'package:cloude_firestore_and_database/String/string_formate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class CustomData extends StatefulWidget {
  @override
  _CustomDataState createState() => _CustomDataState();
}

class _CustomDataState extends State<CustomData> {
  final referenceDatabase = FirebaseDatabase.instance;

  final movieName = 'MovieTitle';

  TextEditingController nameController1 = TextEditingController();
  TextEditingController nameController2 = TextEditingController();

  DatabaseReference _nameRef;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final FirebaseDatabase database = FirebaseDatabase();
    _nameRef = database.reference().child('FullName');
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Enter the First name'),
                      controller: nameController1,
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(hintText: 'Enter the Second name'),
                      controller: nameController2,
                    ),
                    RaisedButton(
                        child: Text('Submit'),
                        onPressed: () {
                          _nameRef.push().set({
                            'FirstName': nameController1.text,
                            'SecondName': nameController2.text,
                          });
                          nameController1.clear();
                          nameController2.clear();
                        }),
                    SizedBox(
                      height: 10.0,
                    ),
                    Flexible(
                      child: FirebaseAnimatedList(
                          shrinkWrap: true,
                          query: _nameRef,
                          itemBuilder: (BuildContext context,
                              DataSnapshot snapShot,
                              Animation<double> animation,
                              int index) {
                            return Card(
                              child: ListTile(
                                  title: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(snapShot.value['FirstName']
                                                .toString() +
                                            " " +
                                            snapShot.value['SecondName']
                                                .toString()),
                                      ),
                                    ],
                                  ),
                                  subtitle: Center(child: Text(formattedDate)),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _nameRef.child(snapShot.key).remove();
                                    },
                                  )),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
