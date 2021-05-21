import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/movie.dart';

class Second extends StatelessWidget {
  Movie movie;
  Second({Key key,this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Hero(
              tag:movie.id,
              child: Container(
                width: double.infinity,
                  child: Image.network("https://image.tmdb.org/t/p/w200" + movie.posterPath, fit :BoxFit.cover)),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5, 8, 0, 4),
                child: Text(
                  movie.title,
                  style: TextStyle(color: Colors.deepOrange, fontSize: 25.0 ,fontWeight: FontWeight.bold),
                )),
            Container(
              padding: new EdgeInsets.fromLTRB(3, 0, 3, 3),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.deepOrangeAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.deepOrangeAccent,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                  //Text("     "),

                  SizedBox(width: 20),
                  Text(movie.voteCount.toString()+" Votes",
                      style: TextStyle(color: Colors.black, fontSize: 18.0)),
                ],
              ),
            ),
            /*Padding(
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
                )),*/
            Padding(
                padding: EdgeInsets.fromLTRB(8, 2, 0, 5),
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.blueGrey,
                        size: 20.0,
                      ),
                      SizedBox(width: 6),
                      Text(movie.releaseDate,style: TextStyle(color: Colors.black)),
                    ],
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 3, 0, 5),
                child: Text(
                  movie.overview,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ))
          ],
        ),
      ),
    );
  }
}
