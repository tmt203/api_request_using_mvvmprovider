import 'dart:convert';

List<Movie> movieList(String str) {
  var json = jsonDecode(str);
  var movieModel = MovieModel.fromJson(json);
  List<Movie> movieDataList = movieModel.data as List<Movie>;
  return movieDataList;
}

class MovieModel {
  List<Movie>? data;
  int? total;

  MovieModel({this.data, this.total});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Movie>[];
      json['data'].forEach((v) {
        data!.add(Movie.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Movie {
  int? id;
  String? title;
  String? releaseDate;
  String? boxOffice;
  int? duration;
  String? overview;
  String? coverUrl;
  String? trailerUrl;
  String? directedBy;
  int? phase;
  String? saga;
  int? chronology;
  int? postCreditScenes;
  String? imdbId;

  Movie(
      {this.id,
      this.title,
      this.releaseDate,
      this.boxOffice,
      this.duration,
      this.overview,
      this.coverUrl,
      this.trailerUrl,
      this.directedBy,
      this.phase,
      this.saga,
      this.chronology,
      this.postCreditScenes,
      this.imdbId});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    releaseDate = json['release_date'];
    boxOffice = json['box_office'];
    duration = json['duration'];
    overview = json['overview'];
    coverUrl = json['cover_url'];
    trailerUrl = json['trailer_url'];
    directedBy = json['directed_by'];
    phase = json['phase'];
    saga = json['saga'];
    chronology = json['chronology'];
    postCreditScenes = json['post_credit_scenes'];
    imdbId = json['imdb_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> movie = <String, dynamic>{};
    movie['id'] = id;
    movie['title'] = title;
    movie['release_date'] = releaseDate;
    movie['box_office'] = boxOffice;
    movie['duration'] = duration;
    movie['overview'] = overview;
    movie['cover_url'] = coverUrl;
    movie['trailer_url'] = trailerUrl;
    movie['directed_by'] = directedBy;
    movie['phase'] = phase;
    movie['saga'] = saga;
    movie['chronology'] = chronology;
    movie['post_credit_scenes'] = postCreditScenes;
    movie['imdb_id'] = imdbId;
    return movie;
  }
}
