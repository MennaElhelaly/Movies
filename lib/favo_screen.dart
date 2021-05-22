import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/sec.dart';
import 'package:provider/provider.dart';

import 'favo.dart';
import 'movie.dart';
import 'movies_model.dart';

class Fav extends StatefulWidget {
  Fav({Key key, this.title}) : super(key: key);
  final String title;
  @override
  FavScreen createState() => FavScreen();
}

class FavScreen extends State<Fav> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MoviesModel>(context, listen: false).getFavoriteList();
    return Consumer<MoviesModel>(
      builder: (_, model, __) {
        return ListView.builder(
            itemCount: model.favorite.length,
            itemBuilder: (context, index) {
              Favorite movie = model.favorite[index];
              return GestureDetector(
                  child: Container(
                    height: 145,
                    color: Colors.white,
                    margin: EdgeInsets.all(2),
                    padding: EdgeInsets.all(2),
                    child: Row(
                      children: [
                        // Hero(
                        //  tag: "photo",
                        Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                  "https://image.tmdb.org/t/p/w200" +
                                      movie.posterPath,
                                  height: 120.0,
                                  width: 125.0,
                                  fit: BoxFit.fill),
                            )),
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                                child: Container(
                                  width:
                                  MediaQuery.of(context).size.width - 160,
                                  child: Text(
                                    movie.title,
                                    style: TextStyle(
                                        color: Colors.deepOrange,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Container(
                              padding: new EdgeInsets.fromLTRB(4, 3, 3, 0),
                              child: Row(
                                children: [
                                  Text("7.3",
                                      style: TextStyle(color: Colors.black,fontSize: 15.0)),
                                  SizedBox(width: 15),
                                  Text(movie.voteCount.toString() + " Votes",
                                      style: TextStyle(color: Colors.black,fontSize: 15.0)),
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
                                  Text(" " + movie.releaseDate,
                                      style: TextStyle(color: Colors.black,fontSize: 13.0)),
                                ],
                              ),
                            ),
                            Container(
                              padding: new EdgeInsets.fromLTRB(0, 5, 3, 0),
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
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
            });
      },
    );

    //        )
    //
    //    );
    // // });
  }
}
