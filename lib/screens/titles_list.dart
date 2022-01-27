import 'package:flutter/material.dart';
import 'package:mymovies/http/webservice.dart';
import 'package:mymovies/screens/titles_profile.dart';

class TitlesList extends StatelessWidget {
  TitlesList(this.screenTitle, this._titlesList, {Key? key}) : super(key: key);
  final String screenTitle;
  final List<String> _titlesList;
  final _getData = GetDataFromAPI();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
      ),
      body: FutureBuilder(
          future: _getData.fetchTitles(_titlesList),
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
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text('Loading'),
                      )
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
                final List<Map<String, dynamic>> titles = snapshot.data as List<Map<String, dynamic>>;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 120,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => TitleProfile(titles[index]['Title'], titles[index]['Ratings'][0]['Value'])
                                  )
                              );
                            },
                            child: Image.network(titles[index]['Poster']),
                          )
                      ),
                    );
                  },
                  itemCount: titles.length,
                );
            }
          }),
    );
  }
}
