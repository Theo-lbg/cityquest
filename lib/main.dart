import 'package:cityquest/Authentificationpages/LoginPage.dart';
import 'package:cityquest/Authentificationpages/inscription.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My City Quest",
      theme: ThemeData(primarySwatch: Colors.red),
       home: LoginPage(),
         );
  }
  
 

  
}
