// ignore: camel_case_types
class movielist {
  final String title, poster, overview;
  final int id;
  final num rating;

  movielist.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        poster = json["poster_path"],
        overview = json["overview"],
        id = json['id'],
        rating = json['vote_average'];
}
