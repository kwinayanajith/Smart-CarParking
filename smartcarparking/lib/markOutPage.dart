import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartcarparking/bookingSlote.dart';

import 'Componentes/components.dart';
import 'HomePage.dart';

class MarkOutPage extends StatefulWidget {

  const MarkOutPage({Key? key,})
      : super(key: key);

  @override
  State<MarkOutPage> createState() => _MarkOutPageState();
}

class _MarkOutPageState extends State<MarkOutPage> {

  String selectedVehicle='';
  String selectedSlot='';

  @override
  void initState() {
    super.initState();
    // Call the function to get the vehicle list when the widget is created
    loadParkingData();

  }

  void loadParkingData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedVehicle = prefs.getString('selected_vehicle') ?? "";
      selectedSlot = prefs.getString('selected_slot') ?? "";
      // Load other parking-related data here if needed
    });
  }

  Future<void> markOutParking(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('parking_status', false);
    // Perform any other actions related to marking out

    // Example: Show a snackbar indicating the user has marked out

  }

  String getCurrentDateTime() {
    final now = DateTime.now();
    final formattedDate = DateFormat('HH:mm:ss').format(now);
    return formattedDate;
  }

  Future<bool> changeAvailability(BuildContext context) async {
    // Prepare the data to be sent to the PHP script.
    var data = {
      "solts_id": selectedSlot,
      "availability": '1',
      "in_time": getCurrentDateTime(),
      "out_time": '',
      "deference": '',
      "used_by": '',
      "vehicle_number": '',
    };

    // URL of your PHP script.
    const url = "http://dev.workspace.cbs.lk/changeAvailabilitySP.php";

    try {
      final res = await http.post(
        Uri.parse(url),
        body: data,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );

      if (res.statusCode == 200) {
        final responseBody = jsonDecode(res.body);

        // Debugging: Print the response data.
        print("Response from PHP script: $responseBody");

        if (responseBody == "true") {
          print('Successful');

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Marked out successfully!'),
              duration: Duration(seconds: 3),
            ),
          );
          markOutParking(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ParkingAvailability()),
          );

          return true; // PHP code was successful.
        } else {
          print('PHP code returned "false".');
          return false; // PHP code returned "false."
        }
      } else {
        print('HTTP request failed with status code: ${res.statusCode}');
        return false; // HTTP request failed.
      }
    } catch (e) {
      print('Error occurred: $e');
      return false; // An error occurred.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mark Out Page'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Out Time: ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                Text(
                  getCurrentDateTime(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.deepPurpleAccent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Parked Vehicle: ',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '$selectedVehicle',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                changeAvailability(context); // Call the function on button press
              },
              child: Text('Mark Your Out'),
            ),
          ],
        ),
      ),
    );
  }
}
