import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcarparking/HomePage.dart';
import 'package:smartcarparking/RegistrationPage.dart';
import 'package:smartcarparking/SignUpPage.dart';
import 'package:http/http.dart' as http;
import 'Componentes/components.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // title:Text("CarParking.lk "),
      // ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [

              SizedBox(height: 100,),

              Text("Welcome Back!",style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54),),

              SizedBox(height: 80,),

              Image.asset("images/image01.png",height: 200,),

              SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: "Email",
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    hintText: "Password",
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Text("Forgot Password?",
              style: TextStyle(
               color: Colors.lightBlue,
               fontWeight: FontWeight.bold,
               fontSize: 20,
              ),),

              SizedBox(height: 30,),

              GestureDetector(onTap: (){
                _login();
              },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)),
                ),
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont’t have Account ?",style: TextStyle(
                    fontSize: 18,
                    color: Colors.black45,
                    fontWeight: FontWeight.bold
                  ),),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                    child: Text(" Create Account",style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              )



            ],
          ),
        ),
      ),

    );

  }
  Future<void> _login() async {
    bool success = await login(context);
    if (success) {
      // Only navigate if login is successful and the account is activated
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  Future<bool> login(BuildContext context) async {
    if (emailController.text.trim().isEmpty) {
      snackBar(context, "Email can't be empty", Colors.redAccent);
      return false;
    }

    if (emailController.text.trim().length < 3) {
      snackBar(context, "Invalid Email.", Colors.yellow);
      return false;
    }

    var url = "http://dev.workspace.cbs.lk/loginSP.php";
    var data = {
      "email": emailController.text.toString().trim(),
      "password_": passwordController.text.toString().trim(),
    };

    http.Response res = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName("utf-8"),
    );

    if (res.statusCode == 200) {
      Map<String, dynamic> result = jsonDecode(res.body);
      print(result);
      bool status = result['status'];
      if (status) {
        if (result['active'] == '1') {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('login_state', '1');
          prefs.setString('user_name', result['user_name']);
          prefs.setString('first_name', result['first_name']);
          prefs.setString('last_name', result['last_name']);
          prefs.setString('email', result['email']);
          prefs.setString('mobile', result['mobile']);
          prefs.setString('password_', result['password_']);
          prefs.setString('user_role', result['user_role']);
          prefs.setString('active', result['active']);

          // Successfully logged in and account is activated
          return true;
        } else {
          snackBar(context, "Account Deactivated", Colors.redAccent);
          return false; // Account deactivated
        }
      } else {
        snackBar(context, "Incorrect Password", Colors.yellow);
        return false; // Incorrect password
      }
    } else {
      snackBar(context, "Error", Colors.redAccent);
      return false; // Error during login
    }
  }
}



