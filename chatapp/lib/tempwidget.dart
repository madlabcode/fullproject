import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
InputDecoration decortemplate(String txt) {
  return InputDecoration(
    fillColor: Colors.white,
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(
            width: 3,
            color: Colors.white
        )
    ),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
        borderSide: BorderSide(
            width: 5,
            color: Colors.blue
        )
    ),

    hintText: txt,
    hintStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,

    ),



  );
}

SizedBox decorbutton(String text)
{
  return SizedBox(
    height: 70,
    width: 330,
    child: ElevatedButton(onPressed: () {  },
      child: Text(text,style: TextStyle(fontSize: 20,),),
      style: ElevatedButton.styleFrom(
          primary: Colors.blue,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40)
          )

      ),

    ),
  );
}





