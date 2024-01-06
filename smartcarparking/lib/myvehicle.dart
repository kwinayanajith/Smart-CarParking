import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class MyVehicle extends StatefulWidget {
  const MyVehicle({super.key});

  @override
  State<MyVehicle> createState() => _MyVehicleState();
}

class _MyVehicleState extends State<MyVehicle> {
  List<Vehicle> vehiclesList = [];


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
    getVehiclesList(userName);
  }


  Future<void> getVehiclesList(String userName,) async {
    vehiclesList.clear();
    var data = {
      "user_name": userName,
    };

    const url = "http://dev.workspace.cbs.lk/getVehiclesListByUser.php";
    http.Response res = await http.post(
      Uri.parse(url),
      body: data,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      encoding: Encoding.getByName("utf-8"),
    );

    if (res.statusCode == 200) {
      final responseJson = json.decode(res.body);
      setState(() {
        for (Map<String, dynamic> details
        in responseJson.cast<Map<String, dynamic>>()) {
          vehiclesList.add(Vehicle.fromJson(details));
        }

        }


      );
    } else {
      throw Exception('Failed to load subtasks from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Vehicle"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: vehiclesList.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10
                    ),
                    color: Colors.lightBlueAccent.shade100,
                  ),
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(vehiclesList[index].vehicleModle),
                    subtitle: Text("ID: ${vehiclesList[index].vehicleNumber}"),
                    leading: Icon(Icons.directions_bus),
                    trailing: IconButton(onPressed: (){}, icon: Icon(Icons.menu_rounded),),
                    // Add more details or customize the ListTile as needed
                  ),
                );
              },
            ),
          ),

      ],
    ),
    );
  }
}

class Vehicle {
  String vehicleNumber;
  String idNumber;
  String vehicleType;
  String vehicleModle;


  Vehicle({
    required this.vehicleNumber,
    required this.idNumber,
    required this.vehicleType,
    required this.vehicleModle,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
        vehicleNumber: json['vehicle_number'],
        idNumber: json['id_number'],
        vehicleType: json['vehicle_type'],
        vehicleModle: json['vehicle_modle'],);
  }
}
