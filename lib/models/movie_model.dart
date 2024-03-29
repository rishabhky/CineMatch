class Movie {
  final String title;
  final String backDrop;
  final String overview;
  final String posterPath;

  Movie(
      {required this.title,
      required this.backDrop,
      required this.overview,
      required this.posterPath});

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
        title: map['title'],
        backDrop: map['backdrop_path'],
        overview: map['overview'],
        posterPath: map['poster_path']);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'backdrop_path': backDrop,
      'overview': overview,
      'poster_path': posterPath
    };
  }
}
