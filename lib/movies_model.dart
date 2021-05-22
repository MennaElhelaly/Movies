import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/movie.dart';

import 'database.dart';
import 'favo.dart';

class MoviesModel extends ChangeNotifier{
  List<Movie> _movies = List();
  List<Movie> get movies => _movies;

  AppDataBase database = AppDataBase();
  List<Favorite> _favoriteList = [];
  List<Favorite> get favorite => _favoriteList;


  addMovies(Movie movie){
    _movies.add(movie);
  }

  Future<List<Movie>>getMovies() async{
    print("******* getting movies popular******");
    var response =await Dio().get(
        'https://api.themoviedb.org/3/movie/popular?',queryParameters: {"api_key":"f55fbda0cb73b855629e676e54ab6d8e" }
    );
    //print(response.data["results"].toString());
    for (var item in response.data["results"] ){
      Movie movie = Movie.fromJson(item);
      movies.add(movie);
    }
    notifyListeners();
    return movies;
  }

  getFavoriteList() {
    print("**************getFavoriteList************");
    database.getMovies().then((value){
      _favoriteList = value;
    });
    notifyListeners();
  }


}



