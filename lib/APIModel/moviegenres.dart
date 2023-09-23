class moviegenres {
  final String title, poster, overview;
  final int id;
  final double rating;
  final List genres;

  moviegenres.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        poster = json["poster_path"],
        overview = json["overview"],
        id = json['id'],
        rating = json['vote_average'],
        genres = json['genres'];
}
