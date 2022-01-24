import 'dart:convert';
import 'package:http/http.dart';

class GetDataFromAPI {
  final String _apikey = 'ed5af931';

  Future<List<String>> fetchTitlesPosters (List<String> listOfTitles) async {
    final List<String> listOfPosters = [];
    for(var i = 0; i < listOfTitles.length; i++) {
      final Response response = await get(Uri.http('omdbapi.com', '', {'i': listOfTitles[i], 'apikey': _apikey}));
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      listOfPosters.add(decodedJson['Poster']);
    }
    return listOfPosters;
  }
}

