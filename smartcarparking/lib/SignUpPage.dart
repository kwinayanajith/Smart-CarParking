import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("CarParking.lk "),
      ),


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 65,),

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
                      hintText: "Enter Your First Name",
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
                      hintText: "Enter Your First Name",
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
                      hintText: "Enter Your First Name",
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
                      hintText: "Enter Your First Name",
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
                      hintText: "Enter Your First Name",
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
              
              SizedBox(height: 10,),
               Text("Already have Account ? Sign In",style: TextStyle(
                 fontSize: 20,
                 color: Colors.black45
               ),)

            ],
          ),
        ),
      ),

    );
  }
}
