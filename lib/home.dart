import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'database/Model.dart';


FirebaseStorage _storage;
Container indicator;
List<String> hosp, doc;
TextStyle title;
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title=new TextStyle(
        fontSize:24, fontFamily: "georgia", color: Colors.black,fontWeight:FontWeight.w700);
    _storage = FirebaseStorage.instance;
    hosp = [];
    doc = [];
    indicator=new Container(
      height:100,
      width: 100,
      child: new Center(
          child: new CircularProgressIndicator(
            value: null,
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),)),
    );
    for (int i = 1; i < 5; i++) {
      hosp.add(null);
      doc.add(null);
    }
    for (int i = 1; i < 5; i++) {
      _storage.ref().child("MediSwift").child("Hosp")
          .child("h$i.jpg")
          .getDownloadURL()
          .then((val) {
        hosp[i - 1] = val;
        setState(() {

        });
      });
      _storage.ref().child("MediSwift").child("doc")
          .child("d$i.jpg")
          .getDownloadURL()
          .then((val) {
        doc[i - 1] = val;
        setState(() {

        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery
        .of(context)
        .size
        .width;
    height = MediaQuery
        .of(context)
        .size
        .height;
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text("MediSwift"),
        backgroundColor: Colors.lightBlue,
        actions: <Widget>[new IconButton(icon: Icon(Icons.search, size: 34,
        ),
          onPressed: () {},
          padding: EdgeInsets.all(10),
        )
        ],
      ),
      drawer: new Drawer(
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new Text("Find nearest Hospitals", style:title,),
            padding:EdgeInsets.all(5),
            alignment:Alignment.center,
            margin: EdgeInsets.only(top:4,bottom: 4),
          ),
          new Divider(thickness:1,),
          new Container(
              width: dw(100.0),
              height: dh(25.0),
              child: new CustomScrollView(
                scrollDirection: Axis.horizontal,
                semanticChildCount: 4,
                slivers: <Widget>[
                  new SliverGrid(
                      delegate: new SliverChildBuilderDelegate((con, i) {
                        return Container(
                          padding:EdgeInsets.all(10),
                          child: (hosp[i]==null) ? new Center(
                            child:indicator):new Image.network(hosp[i],
                            alignment: Alignment.center, width: dw(25),
                            height: dw(25), fit: BoxFit.fill,),
                        );
                      }, childCount: 4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                      ))
                ],
              )),
          new Divider(thickness:1,),
          new Container(
            child: new Text("Find nearest Doctors", style:title,),
            padding:EdgeInsets.all(5),
            alignment:Alignment.center,
            margin: EdgeInsets.only(top:4,bottom: 4),
          ),
          new Divider(thickness:1,),
          new Container(
              width: dw(100.0),
              height: dh(25.0),
              color:Color.fromRGBO(176,176,176,250),
              child: new CustomScrollView(
                scrollDirection: Axis.horizontal,
                semanticChildCount: 4,
                slivers: <Widget>[
                  new SliverGrid(
                      delegate: new SliverChildBuilderDelegate((con, i) {
                        return Container(
                          padding:EdgeInsets.all(10),
                          child: (doc[i] == null) ? new Center(
                                  child:indicator): new Image.network(
                            doc[i], alignment: Alignment.center,
                            width: dw(25),
                            height: dw(25),
                            fit: BoxFit.fill,),
                        );
                      }, childCount: 4),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                      ))
                ],
              )),
          new Divider(thickness:1,),
        ],
      ),
    );
  }
}
