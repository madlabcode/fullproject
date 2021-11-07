import 'package:chatapp/home.dart';
import 'package:chatapp/signup.dart';
import 'package:chatapp/tempwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {



 final _formkey=GlobalKey<FormState>();
  TextEditingController emailid = new TextEditingController();
  TextEditingController  passwd = new TextEditingController();
 final _auth=FirebaseAuth.instance;





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
                Text("LoGiN",style: TextStyle(color: Colors.white,fontSize: 50),),
                SizedBox(
                  height: 40,
                ),
                TextFormField(

                   controller: emailid,
                    onSaved: (value){
                     emailid.text=value!;
                    },
                    validator: (value){
                     if(value!.isEmpty){
                       return("Please enter your email");
                     }
                     if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                         .hasMatch(value)) {
                       return ("Please Enter a valid email");
                     }
                     return null;
                    },

                    style: TextStyle(
                        color: Colors.white
                    ),

                    decoration:decortemplate("Enter email")
                ),
                SizedBox(
                  height: 20,
                ),




                 //PASSWORD
                 TextFormField(
                    controller: passwd,
                     obscureText: true,
                     validator: (value) {
                       RegExp regex = new RegExp(r'^.{6,}$');
                       if (value!.isEmpty) {
                         return ("Password is required for login");
                       }
                       if (!regex.hasMatch(value)) {
                         return ("Enter Valid Password(Min. 6 Character)");
                       }
                     },
                     onSaved: (value){
                       passwd.text=value!;
                     },





                    style: TextStyle(
                        color: Colors.white
                    ),
                    decoration: decortemplate("Enter password")
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Forgot Password?",style: TextStyle(
                        color: Colors.redAccent[400]
                    ),),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),SizedBox(
            height: 70,
            width: 330,
            child: ElevatedButton(onPressed: () {
              signIn(emailid.text,passwd.text);

            },
              child: Text("SIGN IN",style: TextStyle(fontSize: 20,),),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),

              ),

            ),
          )
               ,SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New Here ? ",style: TextStyle(fontSize: 20,
                        color: Colors.white)),
                    InkWell(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>signup()));
                    },
                        child:Text("Register",style: TextStyle(fontSize: 20,
                        color: Colors.blue,decoration: TextDecoration.underline
                    ),))
                  ],
                )





              ],
            ),
          ),
        ),

      ),


    );






  }
 void signIn(String email, String password) async {
   if (_formkey.currentState!.validate()) {
     await _auth
         .signInWithEmailAndPassword(email: email, password: password)
         .then((uid) => {
       Fluttertoast.showToast(msg: "Login Successful"),
       Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) => ho(email: email.toString(), name: ''))),
     })
         .catchError((e) {
       Fluttertoast.showToast(msg: e!.message);
     });
   }
 }
}
