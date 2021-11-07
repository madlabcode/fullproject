
import 'package:flutter/material.dart';

class button1 extends StatelessWidget {
 final Color coltext;
 final String str;

 button1({required this.coltext,required this.str});

  @override
  Widget build(BuildContext context) {
    return  Padding(padding: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: coltext,child: Text(

          str,style: TextStyle(color: Colors.white),
        ),) ,
      ),);
  }
}
