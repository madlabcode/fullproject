import 'package:chatapp/tempwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';
import 'model/user.dart';
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final _auth =FirebaseAuth.instance;
  final _formkey=GlobalKey<FormState>();
  TextEditingController username = new TextEditingController();
  TextEditingController emailid = new TextEditingController();
  TextEditingController passwd = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("UChat",style: TextStyle(fontSize: 40),),
        centerTitle: true,
      ),
      body:
      Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Text("SiGn Up",style: TextStyle(color: Colors.white,fontSize: 50),),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: username,
                    onSaved: (value) {
                      username.text = value!;
                    },



                    style: TextStyle(
                        color: Colors.white
                    ),

                    decoration:decortemplate("Enter Username")
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailid,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("Please Enter Your Email");
                      }

                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return ("Please Enter a valid email");
                      }
                      return null;
                    },
                    onSaved: (value) {
                      emailid.text = value!;
                    },



                    style: TextStyle(
                        color: Colors.white
                    ),

                    decoration:decortemplate("Enter email")
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwd,
                    validator: (value) {
                      RegExp regex = new RegExp(r'^.{6,}$');
                      if (value!.isEmpty) {
                        return ("Password is required for login");
                      }
                      if (!regex.hasMatch(value)) {
                        return ("Enter Valid Password(Min. 6 Character)");
                      }
                    },
                    onSaved: (value) {
                      passwd.text = value!;
                    },

                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: decortemplate("Enter password")
                ),
                SizedBox(
                  height: 25,
                ),


            ElevatedButton(onPressed: () {
              signUpcheck(emailid.text, passwd.text);
            },
              child: Text("SIGN UP",style: TextStyle(fontSize: 20,),),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  )

              ),

            ),SizedBox(
                  height: 30,
                ),






              ],
            ),
          ),
        ),

      ),


    );






  }

  void signUpcheck(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    Userde userModel = Userde(userid: user!.uid, username:username.text , emailid: emailid.text);

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => ho(email: emailid.text, name: username.text)),
            (route) => false);
  }



}
