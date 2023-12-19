import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
   ContactUs({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Us Page"),
      ),
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: Text("Contact Us",style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent

                ),),
              ),

              SizedBox(height: 20,),

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
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      fillColor: Colors.blue.shade100,
                      filled: true,
                      hintText: "Name",
                    ),
                  )
              ),

              SizedBox(height: 10,),

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
                          borderRadius: BorderRadius.circular(10)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(20)
                      ),
                      fillColor: Colors.blue.shade100,
                      filled: true,
                      hintText: "Subject",
                    ),
                  )
              ),

              SizedBox(height: 10,),

              Container(
                  width: 350,
                  height: 100,
                  child: TextField(
                    controller: textController,
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
                          borderRadius: BorderRadius.circular(20)
                      ),
                      fillColor: Colors.blue.shade100,
                      filled: true,
                      hintText: "Messege",
                    ),
                    obscureText: false,
                  )
              ),

              SizedBox(height: 30,),

              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text("Send Messesge",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  )),
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}









