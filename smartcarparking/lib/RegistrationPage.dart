import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcarparking/HomePage.dart';
import 'package:smartcarparking/myvehicle.dart';
import 'Componentes/components.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController vehicleNumberController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController vehicleModelController = TextEditingController();
  String vehicleType = "";

  String userName = "";
  String firstName = "";
  String lastName = "";
  String mobile = "";
  String userRole = "";
  String email = "";
  String password_ = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('user_name') ?? "";
      firstName = prefs.getString('first_name') ?? "";
      lastName = prefs.getString('last_name') ?? "";
      mobile = prefs.getString('mobile') ?? "";
      userRole = prefs.getString('user_role') ?? "";
      email = prefs.getString('email') ?? "";
      password_ = prefs.getString('password_') ?? "";
      print('Loaded data to Home page');
    });
  }


  Future<void> addVehicle (BuildContext context) async {
    // Validate input fields
    if (vehicleNumberController.text.trim().isEmpty ||
        idNumberController.text.trim().isEmpty ||
        vehicleModelController.text.trim().isEmpty
) {
      // Show an error message if any of the required fields are empty
      snackBar(context, "Please fill in all required fields", Colors.red);
      return;
    }

    // Other validation logic can be added here

    // If all validations pass, proceed with the registration
    var url = "http://dev.workspace.cbs.lk/addVehicleSP.php";

    var data = {
      "user_name": userName,
      "vehicle_number": vehicleNumberController.text.toString().trim(),
      "id_number": idNumberController.text.toString().trim(),
      "vehicle_type": vehicleType,
      "vehicle_modle": vehicleModelController.text.toString().trim(),
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
          MaterialPageRoute(builder: (context) => MyVehicle()),
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
      Text('Vehicle Registration Successful!'),
      backgroundColor: Colors.blueAccent, // You can customize the color
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vehicle Registration",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [



              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: vehicleNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "Vehicle Number",
                  ),
                ),
              ),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: idNumberController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "ID Number",
                  ),
                ),
              ),

              SizedBox(height: 15),



              Container(
                height: 60,
                margin: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Expanded(
                    child: Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        return ['Regular', 'Handicap', 'Electric vehicle']
                            .where((String option) {
                          return option.toLowerCase().contains(
                            textEditingValue.text.toLowerCase(),
                          );
                        });
                      },
                      onSelected: (String value) {
                        setState(() {
                          vehicleType = value;
                        });
                      },
                      fieldViewBuilder: (
                          BuildContext context,
                          TextEditingController textEditingController,
                          FocusNode focusNode,
                          VoidCallback onFieldSubmitted,
                          ) {
                        return TextField(
                          controller: textEditingController,
                          focusNode: focusNode,
                          onChanged: (String text) {
                            // Perform search or filtering here
                          },
                          decoration: InputDecoration(
                            hintText: 'Vehicle Type',
                            hintStyle: TextStyle(fontSize: 16),
                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                              BorderSide(color: Colors.lightBlueAccent),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                          ),
                        );
                      },
                      optionsViewBuilder: (
                          BuildContext context,
                          AutocompleteOnSelected<String> onSelected,
                          Iterable<String> options,
                          ) {
                        return Align(
                          alignment: Alignment.topLeft,
                          child: Material(
                            elevation: 4.0,
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 200),
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: ListView(
                                children: options
                                    .map(
                                      (String option) => ListTile(
                                    title: Text(option),
                                    onTap: () {
                                      onSelected(option);
                                    },
                                  ),
                                )
                                    .toList(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: vehicleModelController,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.blue.shade100,
                    filled: true,
                    hintText: "Vehicle Model",
                  ),
                ),
              ),

              SizedBox(height: 15),

              SizedBox(height: 40),

              GestureDetector(
                onTap: () {
                  addVehicle(context);
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
