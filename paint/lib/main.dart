
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}
class da{
  late Offset point;
  late Paint areapaint;
  da({required this.point,required this.areapaint});

}
class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {

  List <da> points=[];
  late Color selcol;
  late double stwid;
  @override
  void initState() {
    selcol=Colors.blue;
    stwid=1.0;
    super.initState();
  }

  void selectcolor(){
    showDialog(context: context, builder: (BuildContext context) { return  AlertDialog(
      title: const Text("color chooser"),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: selcol,
          onColorChanged: (color){
            this.setState(() {
              selcol=color;
            });
          },
        ),
      ),
      actions: <Widget>[
        FlatButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("close"))
      ],

    ); },
   );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text("MY PAINT",style: TextStyle(fontSize: 20,color: Colors.white),),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
              child:Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 560,

                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: GestureDetector(
                        onPanDown: (d){
                          this.setState(() {
                            points.add(da(
                              point: d.localPosition,
                              areapaint: Paint()..strokeCap=StrokeCap.round
                                ..isAntiAlias=true
                                ..color=selcol
                                ..strokeWidth=stwid
                            ));
                          });

                        },

                        onPanUpdate: (d){
                          this.setState(() {
                            points.add(da(
                                point: d.localPosition,
                                areapaint: Paint()..strokeCap=StrokeCap.round
                                  ..isAntiAlias=true
                                  ..color=selcol
                                  ..strokeWidth=stwid
                            ));
                          });
                          },
                        //onPanEnd: (d){
                       //   this.setState(() {
                        //    points.add(null);
                        //  });
                      // },

                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          child: CustomPaint(
                            painter: myp(points: points),
                          ),
                        ),

                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 350,
                      height: 30,

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                      ),
                      child: Row(
                        children: <Widget>[
                          IconButton(onPressed:(){
                            selectcolor();
                          } , icon: Icon(Icons.color_lens,color: Colors.black,)),
                          Expanded(child: Slider(min: 1.0,max: 7.0,activeColor: selcol,value: stwid, onChanged: (double value) {  this.setState(() {
                            stwid=value;
                          });},

                          )),

                          IconButton(onPressed:(){
                            setState(() {
                              points.clear();
                            });
                          } , icon: Icon(Icons.layers_clear)),
                        ],
                      ),
                    ),



                  ],
                ),

              )

          )

        ],
      ),
    );
  }
}
class myp extends CustomPainter{
  late List<da> points;
  myp({required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint bg=Paint()..color=Colors.white;
    Rect re=Rect.fromLTRB(0,0, size.width,size.height);
    canvas.drawRect(re, bg);

    for(int i=0;i<points.length;i++)
      {
        if(points[i]!=null && points[i+1] !=null)
          {
            Paint paint=points[i].areapaint;
            canvas.drawLine(points[i].point, points[i+1].point, paint);
          }else if(points[i]!=null && points[i+1]==null )
            {
              Paint paint=points[i].areapaint;
              canvas.drawPoints(PointMode.points, [points[i].point], paint);
            }
      }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
    throw UnimplementedError();
  }
  
}