import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/database.dart';
import 'package:flutter_app/favo.dart';
import 'package:flutter_app/movie.dart';

class Second extends StatefulWidget {
  Movie movie;

  Second({Key key,this.movie}) : super(key: key);

  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Color _favIconColor = Colors.grey;

  AppDataBase dataBase = AppDataBase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Hero(
              tag:widget.movie.id,
              child: Container(
                width: double.infinity,
                  child: Image.network("https://image.tmdb.org/t/p/w200" + widget.movie.posterPath, fit :BoxFit.cover)),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(5, 8, 0, 4),
                child: Text(
                  widget.movie.title,
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
                  Text(widget.movie.voteCount.toString()+" Votes",
                      style: TextStyle(color: Colors.black, fontSize: 18.0)),
                  SizedBox(width: 60,),
                  IconButton(
                    icon: Icon(Icons.favorite),
                    color: _favIconColor,
                    tooltip: 'Add to favorite',
                    onPressed: () {
                     // setState(() {
                      Favorite movieFav = Favorite();
                      movieFav.id= widget.movie.id;
                          movieFav.title= widget.movie.title;
                          movieFav.overview=widget.movie.overview;
                          movieFav.posterPath=widget.movie.posterPath;
                          movieFav.releaseDate =widget.movie.releaseDate;
                          movieFav.voteCount =widget.movie.voteCount;

                        if(_favIconColor == Colors.grey){
                          setState(() {
                            _favIconColor = Colors.red;
                          });
                          dataBase.insertMovie(movieFav);
                        }else{
                          setState(() {
                            _favIconColor = Colors.grey;
                          });
                        }
                     // });
                    },
                  ),
                ],
              ),
            ),

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
                      Text(widget.movie.releaseDate,style: TextStyle(color: Colors.black)),
                    ],
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(8, 3, 0, 5),
                child: Text(
                  widget.movie.overview,
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ))
          ],
        ),
      ),
    );
  }
}
