import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/sec.dart';


import 'movie.dart';

class Up extends StatefulWidget {
  Up({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Upcoming createState() => Upcoming();
}

class Upcoming extends State<Up> {
  List<Movie> movies =[];


  Future<List<Movie>>getMovies() async{
    print("************* getting movies");
    var response =await Dio().get(
        'https://api.themoviedb.org/3/movie/upcoming?',queryParameters: {"api_key":"f55fbda0cb73b855629e676e54ab6d8e" }
    );
    for (var item in response.data["results"] ){
      Movie movie = Movie.fromJson(item);
      movies.add(movie);
    }
    return movies;
  }
  @override
  /*void initState() {
    // TODO: implement initState
    getMovies();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
            title: Text(widget.title),
            leading:Icon(
              Icons.home,
              color: Colors.white,
            ) ,

          ),*/
        body: Container(
            child : FutureBuilder(
              future: getMovies(),
              builder: (context, snapshot){
                if(snapshot.connectionState== ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                if(snapshot.hasError ){
                  return Center(
                    child: Text(snapshot.error.toString()
                    ),
                  );
                }
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_)=>Second(movie: snapshot.data[index])));
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
                                      child: Image.network("https://image.tmdb.org/t/p/w200" + snapshot.data[index].posterPath,
                                          height: 120.0, width: 125.0, fit: BoxFit.fill),
                                    )),
                                // ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
                                        child: Container(
                                          width: MediaQuery.of(context).size.width-160,
                                          child: Text(
                                            snapshot.data[index].title,
                                            style: TextStyle(color: Colors.deepOrange,fontSize: 16.0 ,fontWeight: FontWeight.bold),
                                          ),
                                        )),
                                    Container(
                                      padding: new EdgeInsets.fromLTRB(4, 3, 3, 0),
                                      child: Row(
                                        children: [
                                          Text(snapshot.data[index].voteAverage.toString(),
                                              style: TextStyle(color: Colors.black)),
                                          SizedBox(width: 10),
                                          Text(snapshot.data[index].voteCount.toString()+" Votes",
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
                                          Text(" "+snapshot.data[index].releaseDate,
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
                            )
                            ,

                          ));
                    }
                );
              },

            )

        )

    );
  }
}