import 'package:flutter/material.dart';
import 'package:mymovies/screens/homepage.dart';

void main() {
  runApp(const MyMovies());
}

class MyMovies extends StatelessWidget {
  const MyMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyMovies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
