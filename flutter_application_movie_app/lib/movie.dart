class Movie {
  int id;
  String title;
  double voteAverage;
  String releaseDate;
  String overview;
  String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.releaseDate,
    required this.overview,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
  return Movie(
    id: parsedJson['id'] as int,
    title: parsedJson['title'] as String,
    voteAverage: (parsedJson['vote_average'] as num).toDouble(),
    releaseDate: parsedJson['release_date'] as String,
    overview: parsedJson['overview'] as String,
    posterPath: parsedJson['poster_path'] as String,
  );
}

}

