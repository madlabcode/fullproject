import 'package:flutter/material.dart';
import 'package:my_flutter_calculator/temp.dart';

void main() {
  runApp(MaterialApp(
    home: myapp(),
  ));
}
class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  Widget button(Color coltext,String str)
  {
    return Padding(padding: EdgeInsets.all(8),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Center(child: Text(
        str,style: TextStyle(color: coltext),
      ),) ,
    ),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Caclulator",style:TextStyle(fontSize: 30,color: Colors.white),),
        centerTitle: true,
      ),
      backgroundColor: Color.fromRGBO(255, 213, 122,1),
        body: Column(
        children: <Widget>[
          Expanded(child: Container(

          )),
          Expanded(
              flex:2
              ,child: Container(
           child: button1(coltext:Colors.red,str: "0"),
            )
          ),


        ],
      ),
    );
  }
}


