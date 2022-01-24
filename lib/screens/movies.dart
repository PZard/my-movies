import 'package:flutter/material.dart';
import 'package:mymovies/http/webservice.dart';

class Movies extends StatelessWidget {
  Movies({Key? key}) : super(key: key);
  final String _screenTitle = 'Movies';
  final _getData = GetDataFromAPI();
  final List<String> _moviesImdbId = ['tt1659337', 'tt10872600', 'tt8579674'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
      ),
      body: FutureBuilder(
          future: _getData.fetchTitlesPosters(_moviesImdbId),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Error.')
                    ],
                  ),
                );
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      Text('Loading')
                    ],
                  ),
                );
              case ConnectionState.active:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Unknown Error')
                    ],
                  ),
                );
              case ConnectionState.done:
                final List<String> posters = snapshot.data as List<String>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 120,
                          height: 190,
                          child: Image.network(posters[index])
                      ),
                    );
                  },
                  itemCount: posters.length,
                );
            }
          }),
    );
  }
}
