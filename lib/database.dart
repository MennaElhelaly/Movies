import 'package:flutter/material.dart';
import 'package:flutter_app/movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'favo.dart';

class AppDataBase {
  static final AppDataBase instance = AppDataBase._internal();
  Database dataBase;
  factory AppDataBase(){
    return instance;
  }
  AppDataBase._internal(){
    createDB();
  }
  createDB()async {
    print("on Created");
    dataBase = await openDatabase(
      join(await getDatabasesPath() ,'movies.db'),
      onCreate: (db,version){
        print("onCreate************");
        db.execute( '''CREATE TABLE movies(id INTEGER PRIMARY KEY,overview TEXT,poster_path TEXT,release_date TEXT,title TEXT,vote_count INTEGER)''');
      },
      version: 6 ,
    );
  }
  insertMovie(Favorite movie)async{
    print("in insert");
    print(dataBase);
    return await dataBase.insert("movies", movie.toJson(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  getMovies()async{
    List<Map<String,dynamic>> maps =await dataBase.query("movies");
    return List.generate(maps.length, (index){
      return Favorite.fromJson(maps[index]);
    });
  }
}
