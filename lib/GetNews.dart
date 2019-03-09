import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'DataType/Article.dart';
Future getJson()  async{
  List josnList;
  List<Articles> listOfData;
  String url="https://newsapi.org/v2/top-headlines?country=us&apiKey=791b5a001f314214814a5893ba725f8b";
  var response = await http.get(url,headers: {"Accept":"application/json"});
  var data;
  if (response.statusCode== 200){
    data=json.decode(response.body);
    josnList=data['articles'];
    if(josnList!=null){
      for (int i=0 ;i<josnList.length;i++) {

      }
    }
  }else
    return data;
}