import 'package:chatapp/signin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'model/user.dart';


class ho extends StatelessWidget {
  String name;
  String email;
  ho({required this.name,required this.email});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("WELCOME HOME"),
        
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(" WELCOME BACK  "),
            SizedBox(
              height: 20,
            ),
            Text("${name}"),
            SizedBox(
              height: 20,
            ),
            Text("${email}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              logout(context);
            }, child: Text("LOGOUT"))


          ],
        ),
      ),
    );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => signin()));
  }
}
