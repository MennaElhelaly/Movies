import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/movie.dart';
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
  List<Movie> movies =[];


  Future<List<Movie>>getMovies() async{
    print("************* getting movies");
    var response =await Dio().get(
      'https://api.themoviedb.org/3/movie/now_playing?',queryParameters: {"api_key":"f55fbda0cb73b855629e676e54ab6d8e" }
    );
    print(response.data["results"].toString());
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
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
                    print(index);
                    return GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>Second(movie: snapshot.data[index])));
                        },
                    child: Container(
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
                                child: Image.network("https://image.tmdb.org/t/p/w200" + snapshot.data[index].posterPath,
                                    height: 75.0, width: 125.0, fit: BoxFit.fill),
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width-160,
                                    child: Text(
                                      snapshot.data[index].title,
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  )),
                              Container(
                                padding: new EdgeInsets.fromLTRB(4, 3, 3, 0),
                                child: Row(
                                  children: [
                                    Text(snapshot.data[index].voteAverage.toString(),
                                        style: TextStyle(color: Colors.black)),
                                    Text("     "),
                                    Text(snapshot.data[index].voteCount.toString()+" Votes",
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
/*
Center(
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
                                  movies2[index],
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
                }
                )
        )
 */