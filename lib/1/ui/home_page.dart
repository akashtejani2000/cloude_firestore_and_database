import 'package:cloude_firestore_and_database/1/ui/advance_page.dart';
import 'package:cloude_firestore_and_database/1/ui/bacsic_page.dart';
import 'package:cloude_firestore_and_database/1/ui/customer/cusotomer_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase database"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              child: Text("Basic Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BasicPage()));
              },
            ),
             RaisedButton(
              child: Text("Advance Page"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdvancePage()));
              },
            ),
             RaisedButton(
              child: Text("Advance Firebase"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomerListViewPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
