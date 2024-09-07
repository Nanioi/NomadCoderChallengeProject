class MovieDetailModel {
  final String title, poster, site, overview;
  final List<Map<String, dynamic>> genres;
  final int runtime;
  final double vote;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        poster = json['poster_path'],
        site = json['homepage'],
        genres = List<Map<String, dynamic>>.from(json['genres']),
        overview = json['overview'],
        runtime = json['runtime'],
        vote = json['vote_average'].toDouble();
}
