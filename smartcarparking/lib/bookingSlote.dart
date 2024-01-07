import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  @override
  void initState() {
    super.initState();
    // Call the function to get the vehicle list when the widget is created
    getVehiclesList();
  }

  Future<void> getVehiclesList() async {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parking Availability"),
      ),
      body: SingleChildScrollView(
        child: Row(
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
