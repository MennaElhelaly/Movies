import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/database.dart';
import 'package:flutter_app/movie.dart';
import 'package:flutter_app/movies_model.dart';
import 'package:flutter_app/sec.dart';
import 'package:provider/provider.dart';

import 'movie_details.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  AppDataBase dataBase = AppDataBase();
  await dataBase.createDB();
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> MoviesModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
       // home: Second(),
       home: MyHomePage(title: 'Movie App'),
      ),
    );
  }
}

