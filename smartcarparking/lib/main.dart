import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcarparking/ContactUsPage.dart';
import 'package:smartcarparking/HelpPage.dart';
import 'package:smartcarparking/HomePage.dart';
import 'package:smartcarparking/LoginPage.dart';
import 'package:smartcarparking/RegistrationPage.dart';
import 'package:smartcarparking/SignUpPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatefulWidget {
  final SharedPreferences prefs;

  const MyApp({Key? key, required this.prefs}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandingPage(prefs: widget.prefs),
    );
  }
}

class LandingPage extends StatelessWidget {
  final SharedPreferences prefs;

  const LandingPage({Key? key, required this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _decideMainPage();
  }

  Widget _decideMainPage() {
    if (prefs.getString('login_state') != null) {
      return const HomePage();
    } else {
      return LoginPage();
    }
  }
}
