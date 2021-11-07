import 'package:finalcalculator/evaluate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalcHome(),
    theme: new ThemeData(scaffoldBackgroundColor: Colors.black),
  ));
}

class CalcHome extends StatelessWidget {
  const CalcHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Calculator"),
        ),
        body: Textview(""));
  }
}

// ignore: must_be_immutable
class Textview extends StatefulWidget {
  String value;
  Textview(this.value);

  @override
  _TextviewState createState() => _TextviewState();
}

class _TextviewState extends State<Textview> {
  void change(name) {
    if (name == '=') {
      setState(() {
        widget.value = evaluation(widget.value);
      });
    } else {
      setState(() {
        widget.value = widget.value + name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.value,
              style: TextStyle(fontSize: 50, color: Colors.white),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ColumnWidget("7", change),
                ColumnWidget("4", change),
                ColumnWidget("1", change),
                ColumnWidget("0", change)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ColumnWidget("8", change),
                ColumnWidget("5", change),
                ColumnWidget("2", change),
                ColumnWidget(".", change)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ColumnWidget("9", change),
                ColumnWidget("6", change),
                ColumnWidget("3", change),
                ColumnWidget("=", change)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 111,
                  height: 80,
                  child: Center(
                      child: IconButton(
                        splashColor: Colors.blue,
                        onPressed: () {
                          setState(() {
                            if (widget.value.length > 0) {
                              widget.value = widget.value
                                  .substring(0, widget.value.length - 1);
                            }
                          });
                        },
                        icon: Icon(
                          Icons.backspace,
                          color: Colors.blueAccent,
                        ),
                      )),
                ),
                Operators("/", change),
                Operators("*", change),
                Operators("-", change),
                Operators("+", change)
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ColumnWidget extends StatelessWidget {
  final String name;
  final ValueChanged<String> update;
  ColumnWidget(this.name, this.update);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 100,
      child: Center(
        child: TextButton(
          onPressed: () {
            update(name);
          },
          child: Text(
            name,
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
      ),
      color: Colors.black,
    );
  }
}

class Operators extends StatelessWidget {
  final String name;
  final ValueChanged<String> update;

  Operators(this.name, this.update);

  @override
  Widget build(BuildContext context) {
    return
       Container(
        width: 80,
        height: 80,
        child: Center(
          child: TextButton(
            onPressed: () {
              update(name);
            },
            child: Text(
              name,
              style: TextStyle(color: Colors.blueAccent, fontSize: 40),
            ),
          ),
        ),

    );
  }
}