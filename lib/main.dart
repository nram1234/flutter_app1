import 'package:flutter/material.dart';
import 'package:flutter_app1/Home.dart';
import 'DataType/Article.dart';
import 'dart:async';
import 'GetNews.dart';
void main() async{




  runApp(Home());
}
class _BodyState extends State<Body> {
  List<Articles>listData=[];
  @override
  void initState() {
    super.initState();



  }
  @override
  Widget build(BuildContext context) {



    return MaterialApp (
      home: Scaffold(
          appBar: AppBar(
            elevation: 14.0,
            title: Text('Top News'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.refresh), onPressed: () {})
            ],
          ),
          body: FutureBuilder(future:getJson() ,builder: (BuildContext context,AsyncSnapshot snapshot){
            return    ListView.builder(
                itemCount:listData.length,
                itemBuilder: (context, int pos) {
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(5.0),
                          shadowColor: Colors.cyanAccent,
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        height: 100.0,
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                          //  color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                Radius.circular(25.0))),
                                      )),
                                  Expanded(
                                      flex: 3,
                                      child: Container(
                                        child:Padding(padding: EdgeInsets.all(8.0),child: Text('uuuuuuuuu'),) ,
                                        decoration: BoxDecoration(
                                          // color: Colors.limeAccent,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                Radius.circular(25.0),
                                                topRight: Radius.circular(25.0))),
                                        width: 200.0,
                                        height: 100.0,
                                      ))
                                ],
                              ),
                              ExpansionTile(
                                title: Text('more'),
                                children: <Widget>[Padding(padding: EdgeInsets.all(8.0),child: Text('jjj'),) ],
                              )
                            ],
                          )),
                    ),
                  );
                });
          })),
    );
  }
  void getDataFromAPI()async{
    listData=await getJson();
  }
}