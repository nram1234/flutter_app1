import 'package:flutter/material.dart';
import 'DataType/Article.dart';
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 14.0,
              title: Text('Top News'),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.refresh), onPressed: () {})
              ],
            ),
            body: Container(
                child: FutureBuilder(
              future: getJson(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Articles>> snapshot) {
                if (snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text(
                        'Loding',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ),
                  );
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int indx) {
                        String urlToImage;
                        String title;
                        String content;
                        if (snapshot.data[indx].urlToImage != null) {
                          urlToImage = snapshot.data[indx].urlToImage;
                        } else {
                          urlToImage =
                              'https://upload.wikimedia.org/wikipedia/commons/6/6c/No_image_3x4.svg';
                        }
                        if (snapshot.data[indx].title != null) {
                          title = snapshot.data[indx].title;
                        } else {
                          title = 'not have title';
                        }
                        if (snapshot.data[indx].title != null) {
                          content = snapshot.data[indx].content;
                        } else {
                          content = 'not have content';
                        }
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
                                              child: Image.network(urlToImage),
                                              height: 100.0,
                                              width: 200.0,
                                              decoration: BoxDecoration(
                                                  //  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  25.0))),
                                            )),
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(title),
                                              ),
                                              decoration: BoxDecoration(
                                                  // color: Colors.limeAccent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomRight:
                                                              Radius.circular(
                                                                  25.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  25.0))),
                                              width: 200.0,
                                              height: 100.0,
                                            ))
                                      ],
                                    ),

                                  ],
                                )),
                          ),
                        );
                      });
                }
              },
            ))));
  }
}
