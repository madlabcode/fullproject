import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  bool f=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("......"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text("HELLO",style: f?TextStyle(fontSize: 50,color: Colors.red):TextStyle(fontSize: 70,color: Colors.pink) ,),
            SizedBox(
              height: 40,
            ),
            RaisedButton(onPressed: (){
             setState(() {
               f=!f;
             });
            },child: Text("CLICK"),)
          ],
        ),
      )


    );
  }
}
