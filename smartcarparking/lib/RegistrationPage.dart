import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
   RegistrationPage({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Vehicale Registration"),
    ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
               Text("Vehicle Registration", style: TextStyle(
                 fontSize: 20,
                 color: Colors.black54,
                 fontWeight: FontWeight.bold
               ),
               ),

              SizedBox(height: 30,),

              Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: textController,
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
                  )
              ),

              SizedBox(height: 15,),

              Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: textController,
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
                  )
              ),

              SizedBox(height: 15,),

              Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: textController,
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
                  )
              ),

              SizedBox(height: 15,),

              Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: textController,
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
                  )
              ),

              SizedBox(height: 15,),

              Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: textController,
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
                      hintText: "Nick Name",
                    ),
                  )
              ),

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
