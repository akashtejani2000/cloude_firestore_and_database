import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Homepage extends StatefulWidget {
  final FirebaseApp app;

  Homepage({this.app});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final referceDatabase = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final ref = referceDatabase.reference();

    TextEditingController nameController = TextEditingController();
    TextEditingController reliesController = TextEditingController();

    final key = GlobalKey();


    final movieTitle = 'movieName';



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
                  color: Colors.grey,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Text(
                        movieTitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: 'Enter the MovieName',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RaisedButton(
                        splashColor: Colors.indigo,
                        onPressed: () {
                          ref
                              .child('MoviesName')
                              .push()
                              .child(movieTitle)
                              .set(nameController.text,)
                              .asStream();
                          nameController.clear();
                        },
                        child: Text('Submit'),
                      ),
                      // Flexible(child: FirebaseAnimatedList(
                      //   query: _,
                      // ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
