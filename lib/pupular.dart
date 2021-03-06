import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/sec.dart';
import 'package:provider/provider.dart';

import 'movie.dart';
import 'movies_model.dart';

class Pupolar extends StatefulWidget {
  Pupolar({Key key, this.title}) : super(key: key);
  final String title;
  @override
  PupolarContan createState() => PupolarContan();
}

class PupolarContan extends State<Pupolar> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MoviesModel>(context, listen: false).getMovies();
    return Consumer<MoviesModel>(
      builder: (_, model, __) {
        return ListView.builder(
            itemCount: model.movies.length,
            itemBuilder: (context, index) {
              Movie movie = model.movies[index];
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => Second(movie: movie)));
                  },
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
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )),
                            Container(
                              padding: new EdgeInsets.fromLTRB(4, 3, 3, 0),
                              child: Row(
                                children: [
                                  Text(movie.voteAverage.toString(),
                                      style: TextStyle(color: Colors.black)),
                                  SizedBox(width: 10),
                                  Text(movie.voteCount.toString() + " Votes",
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
                                  Text(" " + movie.releaseDate,
                                      style: TextStyle(color: Colors.black)),
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
