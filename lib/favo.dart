class Favorite {
  int id;
  String overview;
  String posterPath;
  String releaseDate;
  String title;
  int voteCount;

  Favorite(
      {this.id,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.voteCount});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['vote_count'] = this.voteCount;
    return data;
  }
}