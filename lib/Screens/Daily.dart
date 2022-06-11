// ignore_for_file: prefer_const_constructors

import 'package:budget_app/Services/day_month.dart';
import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  State<Daily> createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  int activeDay=4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.grey,
      body: _Dates(),
      

      floatingActionButton: FloatingActionButton(
            onPressed: () {
             
            },
            child: const Icon(
              Icons.add,
              size: 40,
            ),
            backgroundColor: Colors.blue
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.endFloat
    );
  }
  

  Widget _Dates() {
    var size = MediaQuery.of(context).size;
    //used for daily transaction and search bar white box(at top)
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.01),
                  spreadRadius: 10,
                  blurRadius: 3)
            ]),
            //daily transaction text and search icon
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Daily Transaction",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Icon(Icons.search)
                    ],
                  ),
                  //padding
                  const SizedBox(
                    height: 25,
                  ),
                  //dates shown for user at top
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //individual dates hence /7 (per day)
                    //genrate the dates using day_month
                    children: List.generate(days.length, (index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            activeDay = index;
                          });
                        },
                        child: Container(
                          width: (size.width - 40) / 7,
                          child: Column(
                            
                            children: [
                              //days aka mon, tue etc
                                Text(
                                    days[index]['label'],
                                    style: TextStyle(fontSize: 15),
                                  ),
                              const SizedBox(
                                height: 10,
                              ), //space between date and day
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  //sets active day as blue to highlight from rest which is blue
                                  color: activeDay==index?Colors.blue:Colors.transparent,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    //border to outside of circle
                                    color: activeDay==index?Colors.blue:Colors.black.withOpacity(0.1),
                                  ),
                                ),
                                //date 
                                child: Center(child: Text(days[index]['day'],
                                style: 
                                //chnages colour of the date to black
                                TextStyle(fontSize: 15,color: activeDay==index?Colors.white:Colors.black,),)),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
