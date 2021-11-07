import 'dart:async';

import 'package:flutgame/brick.dart';
import 'package:flutgame/coverscreen.dart';
import 'package:flutter/material.dart';

import 'ball.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}
enum direction { UP ,DOWN}
class _MyAppState extends State<MyApp> {
  double ballx=0;
  double bally=0;
  bool startgame=false;
  var balldirection=direction.DOWN;

  void startg()
  {
    startgame=true;
    Timer.periodic(Duration(
      milliseconds: 1
    ),(timer){
      updatedirection();
      moveball();
    });
  }

  void updatedirection()
  {
    setState(() {
      if(bally>=0.9)
        {
          balldirection=direction.UP;
        }else if(bally<=-0.9)
          {
            balldirection=direction.DOWN;
          }
    });
  }
  void moveball()
  {
setState(() {
  if(balldirection==direction.DOWN)
    {
      bally+=0.01;
    }else if(balldirection==direction.UP)
      {
        bally-=0.01;
      }
});
  }
  @override
  Widget build(BuildContext context) {
    return widget(
      child: GestureDetector(
        onTap: startg,
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
            child: Stack(
              children: [
                cos(startgame),
                br(x: 0.0,y: -0.9,),
                br(x: 0.0,y: 0.9,),
            ba(x:ballx,y: bally),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
