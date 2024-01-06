import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({super.key});

  final vehicleNumberController = TextEditingController();
  final idNumber = TextEditingController();
  final vehicleType = TextEditingController();
  final vehicleModel = TextEditingController();
  final nickName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // appBar: AppBar(
    //   title: Text("Vehicale Registration"),
    // ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
               Text("Vehicle Registration", style: TextStyle(
                 fontSize: 20,
                 color: Colors.black54,
                 fontWeight: FontWeight.bold
               ),
               ),

              SizedBox(height: 30,),

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
                    hintText: "Vehicle Number",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: idNumber,
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
                    hintText: "ID Number",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: vehicleType,
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
                    hintText: "Vehicle Type",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  controller: vehicleModel,
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
                    hintText: "Vehicle Model",
                  ),
                ),
              ),

              SizedBox(height: 15,),

              

              SizedBox(height: 40,),

              Container(
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


            ],
          ),
        ),
      ),
    );
  }
}
