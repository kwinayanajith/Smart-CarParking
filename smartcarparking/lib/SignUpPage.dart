import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Componentes/components.dart';
import 'LoginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController =  TextEditingController();

  Future<void> createUser(BuildContext context) async {
    // Validate input fields
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        phoneNumberController.text.isEmpty ||
        passwordController.text.isEmpty ||



        confirmPasswordController.text.isEmpty) {
      // Show an error message if any of the required fields are empty
      snackBar(context, "Please fill in all required fields", Colors.red);
      return;
    }

    // Other validation logic can be added here

    // If all validations pass, proceed with the registration
    var url = "http://dev.workspace.cbs.lk/createUserSP.php";

    var data = {
      "user_name": firstNameController.text.substring(0, 5) +
          phoneNumberController.text
              .substring(phoneNumberController.text.length - 2),
      "first_name": firstNameController.text.toString().trim(),
      "last_name": lastNameController.text.toString().trim(),
      "email": emailController.text.toString().trim(),
      "password_": passwordController.text.toString().trim(),
      "mobile": phoneNumberController.text.toString().trim(),
      "user_role": '0',
      "active": '1',
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

    if (res.statusCode.toString() == "200") {
      if (jsonDecode(res.body) == "true") {
        if (!mounted) return;
        showSuccessSnackBar(context); // Show the success SnackBar
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      } else {
        if (!mounted) return;
        snackBar(context, "Error", Colors.red);
      }
    } else {
      if (!mounted) return;
      snackBar(context, "Error", Colors.redAccent);
    }
  }

  void showSuccessSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content:
      Text('Registration successful!'),
      backgroundColor: Colors.blueAccent, // You can customize the color
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title:Text("CarParking.lk "),
      // ),


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 120,),

              Text("Welcome Onboard!",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black45,
              ),),

              SizedBox(height: 10,),

              Text("Let’s help up to meet your Task!",style: TextStyle(
                fontSize: 18,
                color: Colors.black54
              ),),

              SizedBox(height: 35,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: firstNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "First Name",
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: lastNameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "Last Name",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "Email",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  keyboardType: TextInputType.number, //get number keyboard
                  controller: phoneNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "Phone Number",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:  20.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "Password",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.blueAccent,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "Re-enter Password",
                  ),
                ),
              ),

              SizedBox(height: 40,),

              GestureDetector(
                onTap: (){
                  createUser(context);
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(child: Text("Register",
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
                   Text("Already have Account ?",style: TextStyle(
                     fontSize: 20,
                     color: Colors.black45
                   ),),

                   TextButton(
                     onPressed: () {
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) => LoginPage()));
                     },
                     child: Text("Sign In",style: TextStyle(
                         fontSize: 20,
                         color: Colors.blue
                     ),),
                   )
                 ],
               ),



            ],
          ),
        ),
      ),

    );
  }
}
