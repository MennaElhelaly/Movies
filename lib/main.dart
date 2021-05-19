import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/sec.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
     // home: Second(),
     home: MyHomePage(title: 'Now Playing'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> movies = ["COCO", "Tangled", "Soul", "Mouana", "Mama","Soul", "Mouana", "Mama"];
  List<String> images = ["assets/images/c.jpg", "assets/images/tan.jpg", "assets/images/mo.jpg", "assets/images/c.jpg", "assets/images/tan.jpg","assets/images/mo.jpg", "assets/images/c.jpg", "assets/images/tan.jpg"];

  List ratings = ["70k reviews","15k reviews","12k reviews","200k reviews","125k reviews",
    "70k reviews","15k reviews","12k reviews","200k reviews","125k reviews"];
  List time = ["1h","2h 30M","7h 00M","1h 30M","2h 30M","3h","2h 30M","9h 00M"];
  List date = ["2021/5/19","2000/5/3", "2015/5/3", "2000/5/3", "2013/5/19", "2021/5/19",
    "2000/5/3", "2015/5/3"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
        body: Center(
            child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  print(index);
                  return Container(
                    height: 130,
                    color: Colors.white,
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 7, 15, 7),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(images[index],
                                  height: 75.0, width: 125.0, fit: BoxFit.fill),
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  movies[index],
                                  style: TextStyle(color: Colors.black),
                                )),
                            Container(
                              padding: new EdgeInsets.fromLTRB(0, 3, 3, 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.deepOrange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.deepOrange,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                  Text("     "),
                                  Text(ratings[index],
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                            Container(
                              padding: new EdgeInsets.fromLTRB(3, 5, 3, 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.black,
                                    size: 15.0,
                                  ),
                                  Text(time[index],
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                            Container(
                              padding: new EdgeInsets.fromLTRB(3, 5, 3, 0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    color: Colors.black,
                                    size: 15.0,
                                  ),
                                  Text(date[index],
                                      style: TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                    ,

                  );
                }))

    );
  }
}
