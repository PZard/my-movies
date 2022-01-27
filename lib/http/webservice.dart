import 'dart:convert';
import 'package:http/http.dart';

class GetDataFromAPI {
  final String _apikey = 'ed5af931';

  Future<List<Map<String, dynamic>>> fetchTitles (List<String> listOfTitles) async {
    final List<Map<String, dynamic>> titles = [];
    for(var i = 0; i < listOfTitles.length; i++) {
      final Response response = await get(Uri.http('omdbapi.com', '', {'i': listOfTitles[i], 'apikey': _apikey}));
      final Map<String, dynamic> decodedJson = jsonDecode(response.body);
      titles.add(decodedJson);
    }
    print(titles);
    return titles;
  }
}

