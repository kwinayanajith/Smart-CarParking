import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

              SizedBox(height: 50,),

              Text("Welcome Back!",style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black54),),

              SizedBox(height: 80,),
              
              Image.asset("images/image01.png",height: 200,),

              SizedBox(height: 50,),

              Container(
                  width: 350,
                  height: 50,
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
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "Email",
                    ),
                  )
              ),

              SizedBox(height: 10,),

              Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
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
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      hintText: "Password",
                    ),
                  )
              ),

              SizedBox(height: 20,),

              Text("Forgot Password?",
              style: TextStyle(
               color: Colors.lightBlue,
               fontWeight: FontWeight.bold,
               fontSize: 20,
              ),),

              SizedBox(height: 30,),

              Container(
                height: 60,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(child: Text("Sign In?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),)),
              ),

              SizedBox(height: 10,),
              
              Text("Dont’t have Account ? Sign Up",style: TextStyle(
                fontSize: 18,
                color: Colors.black45,
                fontWeight: FontWeight.bold
              ),)



            ],
          ),
        ),
      ),
      
    );
  }
}



