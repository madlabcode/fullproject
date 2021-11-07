import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttergame/barrier.dart';
import 'package:fluttergame/mainchar.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static double yaxis=0;
  double time=0;
  double height=0;
  double initialheight=yaxis;
  bool gamestart=false;
  static double bx1=0;
  double bx2=1.5 + bx1;


  @override
  void jump()
  {
    setState(() {
      time=0;
      initialheight=yaxis;
    });
  }
  void startg(){
    gamestart=true;
    Timer.periodic(Duration(milliseconds: 60),(timer){

      time+=0.05;
      height=-4.9*time*time+2.8*time;
      setState(() {

        yaxis=initialheight-height;
        bx1-=0.05;
        bx2-=0.05;
      });
      if(yaxis>1){
        timer.cancel();
        gamestart=false;
      }
    });


  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex:2,child: Stack(
            children: [
              GestureDetector(
                onTap: (){
                  if(gamestart)
                  {
                    jump();
                  }else{
                    startg();
                  }
                },
                child: AnimatedContainer(

                  duration: Duration(milliseconds: 0),
                  alignment: Alignment(0,yaxis),
                  color: Colors.blue,
                  child:   ch(),
                ),
              ),
              Container(
                alignment: Alignment(0,-0.3),
                 child: gamestart?Text(" "):Text("TAP TO PLAY ",style: TextStyle(fontSize: 20,color: Colors.white),),
              ),
              AnimatedContainer(
                alignment: Alignment(bx1,1.1),
                duration: Duration(milliseconds: 0),
                child: MyBarrier(
                  size: 200.0,
                ),
              ),
              AnimatedContainer(
                alignment: Alignment(bx1,-1.1),
                duration: Duration(milliseconds: 0),
                child: MyBarrier(
                  size: 200.0,
                ),
              ),
              AnimatedContainer(
                alignment: Alignment(bx2,1.1),
                duration: Duration(milliseconds: 0),
                child: MyBarrier(
                  size: 250.0,
                ),
              ),
              AnimatedContainer(
                alignment: Alignment(bx2, -1.1),
                duration: Duration(milliseconds: 0),
                child: MyBarrier(
                  size: 150.0,
                ),
              )

            ],
          ) ),Expanded(child: Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("SCORE",style: TextStyle(color: Colors.white,fontSize: 20),),
                    SizedBox(height: 20,),
                    Text("0",style: TextStyle(color: Colors.white,fontSize: 35)),

                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("HIGH SCORE",style: TextStyle(color: Colors.white,fontSize: 20),),
                    SizedBox(height: 20,),

                    Text("100",style: TextStyle(color: Colors.white,fontSize: 35)),

                  ],
                ),

              ],
            ),

          ))
        ],
      ),
    );
  }
}


