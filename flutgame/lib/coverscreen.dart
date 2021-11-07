import 'package:flutter/material.dart';
class cos extends StatelessWidget {
final bool games;
cos(this.games);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0,-0.2),
      child: Text(games?'':'TAP TO PLAY',style: TextStyle(color: Colors.white),
      ),
    );
  }
}
