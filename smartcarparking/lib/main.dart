import 'package:flutter/material.dart';
import 'package:smartcarparking/ContactUsPage.dart';
import 'package:smartcarparking/HelpPage.dart';
import 'package:smartcarparking/HomePage.dart';
import 'package:smartcarparking/LoginPage.dart';
import 'package:smartcarparking/RegistrationPage.dart';
import 'package:smartcarparking/SignUpPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage()
      );

  }
}

