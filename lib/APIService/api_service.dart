import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movieapp/APIModel/moviedetail.dart';
import 'package:movieapp/APIModel/movielist.dart';

class APIService {
  static String baseURL = "https://movies-api.nomadcoders.workers.dev";
  static String popular = "popular";
  static String nowcimena = "now-playing";
  static String coming = "coming-soon";
  static String detailURL =
      "https://movies-api.nomadcoders.workers.dev/movie?id=";

  static Future<List<movielist>> getPopularMovie() async {
    final url = Uri.parse("$baseURL/$popular");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      final movieresult = results['results'];

      List<movielist> movieInstance = [];
      final List<dynamic> movies = movieresult;
      for (var movie in movies) {
        movieInstance.add(movielist.fromJson(movie));
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<List<movielist>> getnowincinema() async {
    final url = Uri.parse("$baseURL/$nowcimena");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      final movieresult = results['results'];

      List<movielist> movieInstance = [];
      final List<dynamic> movies = movieresult;
      for (var movie in movies) {
        movieInstance.add(movielist.fromJson(movie));
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<List<movielist>> getcomingsoonmovie() async {
    final url = Uri.parse("$baseURL/$coming");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final results = jsonDecode(response.body);
      final movieresult = results['results'];

      List<movielist> movieInstance = [];
      final List<dynamic> movies = movieresult;
      for (var movie in movies) {
        movieInstance.add(movielist.fromJson(movie));
      }
      return movieInstance;
    }
    throw Error();
  }

  static Future<movieDetails> getMovieDetailsByid(String id) async {
    final url = Uri.parse("$detailURL$id");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final movie = jsonDecode(response.body);

      return movieDetails.fromJson(movie);
    }
    throw Error();
  }
}
