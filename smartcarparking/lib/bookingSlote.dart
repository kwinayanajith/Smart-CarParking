import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ParkingAvailability extends StatefulWidget {
  const ParkingAvailability({Key? key}) : super(key: key);

  @override
  State<ParkingAvailability> createState() => _ParkingAvailabilityState();
}

class _ParkingAvailabilityState extends State<ParkingAvailability> {
  List<Slots> slotsList = [];
  List<Slots> electricSlotsList = [];
  List<Slots> handicapSlotsList = [];
  List<Slots> regularSlotsList = [];

  List<Vehicles> vehiclesList = [];

  String userName = "";
  String firstName = "";
  String lastName = "";
  String mobile = "";
  String userRole = "";
  String email = "";
  String password_ = "";

  String? selectedVehicle;

  String getCurrentDateTime() {
    final now = DateTime.now();
    final formattedDate = DateFormat('HH:mm:ss').format(now);
    return formattedDate;
  }

  @override
  void initState() {
    super.initState();
    // Call the function to get the vehicle list when the widget is created
    getSlotsList();
    loadData();
  }


  Future<void> getSlotsList() async {
    slotsList.clear();
    electricSlotsList.clear();
    handicapSlotsList.clear();
    regularSlotsList.clear();

    var data = {};

    const url = "http://dev.workspace.cbs.lk/getSlots.php";
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
          Slots slot = Slots.fromJson(details);
          slotsList.add(slot);

          // Categorize the slots based on slotID
          if (slot.slotID.startsWith('E')) {
            electricSlotsList.add(slot);
          } else if (slot.slotID.startsWith('H')) {
            handicapSlotsList.add(slot);
          } else if (slot.slotID.startsWith('R')) {
            regularSlotsList.add(slot);
          }
        }
      });
    } else {
      throw Exception('Failed to load subtasks from API');
    }
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
          vehiclesList.add(Vehicles.fromJson(details));
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
        title: Text("Parking Availability"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text('For EV'),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: electricSlotsList.length,
                        itemBuilder: (context, index) {
                          Color tileColor = electricSlotsList[index].availability == '1' ? Colors.white : Colors.red;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: tileColor,
                            ),
                            child: ListTile(
                              title: Text(electricSlotsList[index].slotID),
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text('For HV'),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: handicapSlotsList.length,
                        itemBuilder: (context, index) {
                          Color tileColor = handicapSlotsList[index].availability == '1' ? Colors.white : Colors.red;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: tileColor,
                            ),
                            child: ListTile(
                              title: Text(handicapSlotsList[index].slotID),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text('For RV'),
                      Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: regularSlotsList.length,
                        itemBuilder: (context, index) {
                          Color tileColor = regularSlotsList[index].availability == '1' ? Colors.white : Colors.red;
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: tileColor,
                            ),
                            child: ListTile(
                              title: Text(regularSlotsList[index].slotID),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
            
            SizedBox(height: 10,),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('In Time: ',style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurpleAccent
                ),),
                Text(getCurrentDateTime(),style: TextStyle(
                  fontSize: 18,
                  color: Colors.deepPurpleAccent
                ),),
              ],
            ),

            SizedBox(height: 15,),

            DropdownButton<String>(
              hint: Text('Select Your Vehicle'),
              value: selectedVehicle,
              onChanged: (newValue) {
                setState(() {
                  selectedVehicle = newValue!;
                  print('Selected Vehicle: $selectedVehicle');
                });
              },
              items: vehiclesList.map<DropdownMenuItem<String>>((vehicle) {
                return DropdownMenuItem<String>(
                  value: vehicle.vehicleNumber,
                  child: Text(vehicle.vehicleNumber),
                );
              }).toList(),
            ),

            ElevatedButton(
              onPressed: () {

              },
              child: Text('Park In'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade700,
              ),
            ),


            
          ],
        ),
      ),
    );
  }
}

class Slots {
  String slotID;
  String availability;

  Slots({
    required this.slotID,
    required this.availability,
  });

  factory Slots.fromJson(Map<String, dynamic> json) {
    return Slots(
      slotID: json['solts_id'],
      availability: json['availability'],
    );
  }
}



class Vehicles {
  String vehicleNumber;


  Vehicles({
    required this.vehicleNumber,
  });

  factory Vehicles.fromJson(Map<String, dynamic> json) {
    return Vehicles(
      vehicleNumber: json['vehicle_number'],);
  }
}
