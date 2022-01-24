import 'package:flutter/material.dart';
import 'series.dart';
import 'movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String _screenTitle = 'MyMovies';

  void _navigateMoviesPage (BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => Movies()
      )
    );
  }
  void _navigateSeriesPage (BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => Series()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _HomePageButton('Movies', Icons.movie, navigation: () => _navigateMoviesPage(context)),
                _HomePageButton('TV Series', Icons.tv, navigation: () => _navigateSeriesPage(context))
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _HomePageButton extends StatelessWidget {
  const _HomePageButton(this.name, this.icon, {required this.navigation, Key? key}) : super(key: key);
  final String name;
  final IconData icon;
  final Function navigation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => navigation(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}