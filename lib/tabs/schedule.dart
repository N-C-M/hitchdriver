import 'package:cabdriver/brand_colors.dart';
import 'package:cabdriver/globalvariabels.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class schedule extends StatefulWidget {
  @override
  _scheduleState createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {

  TextEditingController pickuploc=new TextEditingController();
    TextEditingController destloc=new TextEditingController();
  TextEditingController date=new TextEditingController();
  TextEditingController time=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: SingleChildScrollView(
              child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 37, 0, 0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height:20),
                Text(
                  "Schedule A Ride",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: <Widget>[
                                    SizedBox(height:20),

                      TextField(
                        controller: pickuploc,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
                            hintText: 'Pick Up Point')
                            ,
                           
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      
                      TextField(
                        controller: destloc,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
                            hintText: 'Destination'),
                            
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: date,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
                            hintText: 'Date: 09-05-2000'),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: time,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: const OutlineInputBorder(
        // width: 0.0 produces a thin "hairline" border
        borderSide: const BorderSide(color: Colors.grey, width: 0.0),
    ),
                            hintText: 'Time: 9:00 PM'),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      MaterialButton(
                          
                          height: 60.0,
                          
                          minWidth: 80,
                          color: Colors.blueGrey,
                          onPressed: (
                          ) {

                            DatabaseReference schedule = FirebaseDatabase.instance.reference().child('schedule').push();
                          Map value ={
                            'pickpt':pickuploc.text,
                            'droppt':destloc.text,
                            'date':date.text,
                            'time':time.text,
                            'driverphone':currentDriverInfo.phone,
                            'drivername':currentDriverInfo.fullName,
                            

                          };
                          schedule.set(value);
                          pickuploc.clear();
                          destloc.clear();
                          date.clear();
                          time.clear();
                          },
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
