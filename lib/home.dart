import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'main.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseStorage _storage;
List<String> hosp,doc;
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _storage=FirebaseStorage.instance;
    hosp=[];
    doc=[];
    for(int i=1;i<5;i++)
      {
       hosp.add(null);
       doc.add(null);
      }
    for(int i=1;i<5;i++) {
      _storage.ref().child("MediSwift").child("Hosp")
          .child("h$i.jpg")
          .getDownloadURL()
          .then((val) {
        hosp[i - 1] = val;
        setState(() {

        });
      });
      _storage.ref().child("MediSwift").child("doc").child("d$i.jpg").getDownloadURL().then((val){
        doc[i-1]=val;
      setState(() {

      });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar:new AppBar(
        title:new Text("MediSwift"),
        backgroundColor:Colors.lightBlue,
        actions: <Widget>[new IconButton( icon:Icon(Icons.search,size:34,
        ),
          onPressed: (){},
          padding:EdgeInsets.all(10),
        )],
      ),
      drawer: new Drawer(
      ),
      body:new Column(
        children: <Widget>[
         new Text("Find nearest Hospitals",style:new TextStyle(fontSize:25,fontFamily:"arial",color:Colors.black),),
         new Padding(padding: EdgeInsets.all(15)),
          new Container(
            width:dw(100.0),
           height:dh(30.0),
         child: new CustomScrollView(
           scrollDirection:Axis.horizontal,
           semanticChildCount: 4,
           slivers: <Widget>[
             new SliverGrid(delegate:new SliverChildBuilderDelegate((con,i){
               
               return Container(
                 child:(hosp[i]==null)?new Container(
                   height: 100,
                     width: 100,
                     child:new CircularProgressIndicator(value: null,)):new Image.network(hosp[i],alignment: Alignment.center,width:dw(25),height:dw(30),fit:BoxFit.fill,),
               );
             },childCount: 4), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount:1,
               mainAxisSpacing:5,
             ))
           ],
         )),
          new Padding(padding: EdgeInsets.all(15)),
          new Text("Find nearest Doctors",style:new TextStyle(fontSize:25,fontFamily:"arial",color:Colors.black),),
          new Padding(padding: EdgeInsets.all(15)),
          new Container(
              width:dw(100.0),
              height:dh(30.0),
              child: new CustomScrollView(
                scrollDirection:Axis.horizontal,
                semanticChildCount: 4,
                slivers: <Widget>[
                  new SliverGrid(delegate:new SliverChildBuilderDelegate((con,i){
                    return Container(
                      child:(doc[i]==null)?new Container(
                        height: 100,
                      width: 100,
                      child:new CircularProgressIndicator(value: null,)):new Image.network(doc[i],alignment: Alignment.center,width:dw(25),height:dw(30),fit:BoxFit.fill,),
                    );
                  },childCount: 4), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:1,
                    mainAxisSpacing:5,
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
