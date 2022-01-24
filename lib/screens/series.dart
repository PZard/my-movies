import 'package:flutter/material.dart';
import 'package:mymovies/http/webservice.dart';

class Series extends StatelessWidget {
  Series({Key? key}) : super(key: key);
  final String _screenTitle = 'TV Series';
  final _getData = GetDataFromAPI();
  final List<String> _seriesImdbId = ['tt7134908', 'tt1442437', 'tt8772296'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screenTitle),
      ),
      body: FutureBuilder(
          future: _getData.fetchTitlesPosters(_seriesImdbId),
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
                final List<String> posters = snapshot.data as List<
                    String>;
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
