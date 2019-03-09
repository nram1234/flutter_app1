import 'package:flutter/material.dart';
import 'DataType/Article.dart';
import 'dart:async';
import 'GetNews.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Articles> listData;

  void getdata() async {
    listData = await getJson();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int i) {
              Text(listData[i].title);
            }),
      ),
      title: "Top News",
    );
  }
}
