import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("HomePage"),
      ),

      body: Column(
        children: [
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                  Container(
                    height: 135,
                    width: 135,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15),
                    ),

                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text("Vehicle Registration",style: TextStyle(
                                fontSize: 18,
                                color: Colors.white
                              ),),
                      ),
                    ),
                        ),

                Container(
                  height: 135,
                  width: 135,
                  decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(15)
                  ),

                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("My Vehicle",style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),),
                    ),
                  ),
                ),

              ],
            ),
          ),

          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 135,
                width: 135,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Booking Slot",style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),

              Container(
                height: 135,
                width: 135,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Tour",style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 135,
                width: 135,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Contact Us",style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),

              Container(
                height: 135,
                width: 135,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(15)
                ),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Help",style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),),
                  ),
                ),
              ),
            ],
          ),


        ],
      ),

    );
  }
}
