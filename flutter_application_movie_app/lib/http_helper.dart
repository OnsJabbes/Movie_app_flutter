import 'package:http/http.dart' as http;
import 'dart:io'; //tekhdem beha httpstatus 
import 'dart:convert';
import 'movie.dart'; 



final String urlKey = 'api_key=8cb8069f79972d33206788bbc0dbb8c3';
final String urlBase = 'https://api.themoviedb.org/3/movie';
final String urlUpcoming = '/upcoming?';
final String urlLanguage = '&language=en-US';


class HttpHelper {
  Future<List<Movie>> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    
    try {
      final http.Response result = await http.get(Uri.parse(upcoming));
      if (result.statusCode == HttpStatus.ok) {
        final jsonResponse = json.decode(result.body);

        // Now, 'jsonResponse' is a Dart object representing the parsed JSON data.

        final moviesMap = jsonResponse['results'];
        List<Movie> movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
        return movies;
      } else {
        throw Exception('Failed to load data from the server. Status code: ${result.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make the request: $e');
    }
  }
}
