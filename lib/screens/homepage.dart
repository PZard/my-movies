import 'package:flutter/material.dart';
import 'titles_list.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final String screenTitle = 'MyMovies';
  final List<String> _moviesImdbId = ['tt1659337', 'tt10872600', 'tt8579674'];
  final List<String> _seriesImdbId = ['tt7134908', 'tt1442437', 'tt8772296'];

  void _navigateTitlesPage (BuildContext context, String screenName, List<String> listOfTitle) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => TitlesList(screenName, listOfTitle)
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _HomePageButton('Movies', Icons.movie, navigation: () => _navigateTitlesPage(context, 'Movies', _moviesImdbId)),
                _HomePageButton('TV Series', Icons.tv, navigation: () => _navigateTitlesPage(context, 'TV Series', _seriesImdbId))
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
      child: InkWell(
        onTap: () => navigation(),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary,
          ),
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
    );
  }

}