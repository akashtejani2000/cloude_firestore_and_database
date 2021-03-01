import 'package:cloude_firestore_and_database/Screen/Homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '1/ui/login/signin_page.dart';
import 'Screen/real_time_database.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SignInPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
