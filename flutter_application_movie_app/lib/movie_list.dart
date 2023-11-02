import 'package:flutter/material.dart';
import 'http_helper.dart';
import 'movie.dart'; // Import your Movie class

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late HttpHelper helper;
  int moviesCount = 0; // Initialize moviesCount
  List<Movie> movies = []; // Initialize movies as a list of Movie objects

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  Future<void> initialize() async {
    movies = await helper.getUpcoming();
    setState(() {
      moviesCount = movies.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Container(),
    );
  }
}
