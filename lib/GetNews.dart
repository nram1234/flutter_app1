import 'dart:async';
import 'dart:convert' show json;
import 'package:http/http.dart' show get;
import 'DataType/Article.dart';
Future <List<Articles>> getJson()  async{
  List josnList=[];
  List<Articles> listOfData=[];
  String url="https://newsapi.org/v2/top-headlines?country=us&apiKey=791b5a001f314214814a5893ba725f8b";
  var response = await  get(url,headers: {"Accept":"application/json"});
  var data;

    data=json.decode(response.body);
    josnList=data['articles']as List;
    if(josnList!=null){
      for (int i=0 ;i<josnList.length;i++) {
listOfData.add(new Articles.fromJson(josnList[i]));

      }
    }

    return listOfData;
}












