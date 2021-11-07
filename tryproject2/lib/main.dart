import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home:MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(label: "HOME" ,icon: Icon(Icons.home),

        ),
        BottomNavigationBarItem(label: "DELETE",icon: Icon(Icons.delete),

        ),
      ],

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.plus_one),
      ),
      drawer: Drawer(

      ),
      body: Text("HELLO WORLD"),

    );
  }
}