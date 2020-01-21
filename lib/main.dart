import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssip_projet/home.dart';

double height, width;
bool eye = true;

void main() => runApp(new MaterialApp(
      home: MyHome(),
    ));
TextEditingController _user = new TextEditingController(),
    _pass = new TextEditingController();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    if (width == null &&
        MediaQuery.of(context).orientation == Orientation.portrait) {
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.height;
    }
    return new Scaffold(
        body: new Container(
      width: dw(100),
      height: dh(100),
      child: new Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Image.asset(
            "images/mediback3.jpg",
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
            width: dw(100),
            height: dh(100),
          ),
          new Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.center,
            child: new ListView(
              children: <Widget>[
                new Image.asset(
                  "images/medilogo.png",
                  fit: BoxFit.fill,
                  width: dw(60),
                  height: dh(25),
                  colorBlendMode: BlendMode.darken,
                ),
                new Container(
                    width: 350,
                    height: 70,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: new TextField(
                      controller: _user,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      textAlign: TextAlign.start,
                      cursorRadius: Radius.circular(8),
                      showCursor: true,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: false,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "georgia"),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          border: new MyBorder(),
                          prefixIcon: Icon(
                            Icons.person,
                            size: 40,
                            color: Colors.green.shade500,
                          ),
                          hintText: "gmail or mobile number",
                          hintStyle: new TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontFamily: "georgia")),
                    )),
                new Padding(padding: EdgeInsets.all(20)),
                new Container(
                    width: 350,
                    height: 70,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: new TextField(
                      controller: _pass,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      obscureText: eye,
                      textAlign: TextAlign.start,
                      cursorRadius: Radius.circular(8),
                      showCursor: true,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: false,
                      style: new TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontFamily: "georgia"),
                      decoration: InputDecoration(
                          border: MyBorder(),
                          contentPadding: EdgeInsets.all(20),
                          prefixIcon: Icon(
                            Icons.lock,
                            size:40,
                            color: Colors.green.shade500,
                          ),
                          hintText: "password",
                          hintStyle: new TextStyle(
                              color: Colors.grey,
                              fontSize: 22,
                              fontFamily: "georgia")),
                    )),
                new Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  new Checkbox(
                      value: !eye,
                      onChanged: (res) {
                        eye = !eye;
                        setState(() {});
                      },
                      activeColor: Colors.green.shade800),
                  new Text(
                    "show password",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey.shade900,
                        backgroundColor: Colors.white),
                  )
                ]),
                new Container(
                  child: new FlatButton(
                    onPressed: () {},
                    child: new Text(
                      "Log in",
                      style: new TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.all(Radius.circular(10)),
                      side:BorderSide(style:BorderStyle.solid,color:Colors.lightBlueAccent.shade400)
                    ),
                    color: Colors.lightBlueAccent.shade400,
                    padding:EdgeInsets.all(10),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(5)),
                new InkWell(
                  child: new Text(
                    "forgot password",
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        backgroundColor: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                )
              , new Padding(padding: EdgeInsets.all(5)),
                new InkWell(
                  child: new Text(
                    "New user? Register",
                    style: new TextStyle(
                        color: Colors.black,
                        fontSize: 23,
                        backgroundColor: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class MyBorder extends InputBorder {
  @override
  InputBorder copyWith({BorderSide borderSide}) {
    // TODO: implement copyWith
    return null;
  }

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    return null;
  }

  @override
  // TODO: implement isOutline
  bool get isOutline => false;

  @override
  void paint(Canvas canvas, Rect rect,
      {double gapStart,
      double gapExtent = 0.0,
      double gapPercentage = 0.0,
      TextDirection textDirection}) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = Colors.lightBlueAccent.shade400;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 3.0;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        paint);
  }

  @override
  ShapeBorder scale(double t) {
   return null;
  }
}

double dw(double pt) => pt * width / 100;

double dh(double pt) => pt * height / 100;
