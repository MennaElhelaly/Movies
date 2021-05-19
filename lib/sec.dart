import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Second extends StatelessWidget {
  const Second({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/tann.jpg"),
          Padding(
              padding: EdgeInsets.fromLTRB(5, 8, 0, 5),
              child: Text(
                "Tangled",
                style: TextStyle(color: Colors.deepOrange, fontSize: 25.0),
              )),
          Container(
            padding: new EdgeInsets.fromLTRB(3, 0, 3, 3),
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
                Text("100k reviews",
                    style: TextStyle(color: Colors.black, fontSize: 18.0)),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      color: Colors.blueGrey,
                      size: 20.0,
                    ),
                    Text(" 3:30 H",
                        style: TextStyle(color: Colors.black, fontSize: 20.0)),
                  ],
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(8, 0, 0, 5),
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.blueGrey,
                      size: 20.0,
                    ),
                    Text(" 2021/5/19", style: TextStyle(color: Colors.black)),
                  ],
                ),
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(8, 3, 0, 5),
              child: Text(
                "Tangled is a 2010 American 3D computer-animated musical adventure film[2] produced by Walt Disney Animation Studios and released by Walt Disney Pictures. Loosely based on the German fairy tale  Rapunzel in the collection of folk tales published by the Brothers Grimm.",
                style: TextStyle(color: Colors.black, fontSize: 15.0),
              ))
        ],
      ),
    );
  }
}
