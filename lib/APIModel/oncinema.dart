class onecimena {
  final String title, poster, overview;
  final int id;
  final num rating;

  onecimena.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        poster = json["poster_path"],
        overview = json["overview"],
        id = json['id'],
        rating = json['vote_average'];
}
