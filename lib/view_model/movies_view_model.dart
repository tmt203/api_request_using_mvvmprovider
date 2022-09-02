import 'package:api_request/models/movie_error.dart';
import 'package:api_request/repo/api_status.dart';
import 'package:api_request/repo/movie_services.dart';
import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class MoviesViewModel extends ChangeNotifier {
  MoviesViewModel() {
    getMovies();
  }

  bool _loading = false;
  List<Movie> _movieList = [];
  Movie? _movie;
  MovieError? _movieError;

  bool get loading => _loading;
  List<Movie> get movieList => _movieList;
  Movie? get movie => _movie;
  MovieError? get movieError => _movieError;

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setMovieList(List<Movie> movieList) {
    _movieList = movieList;
  }

  setMovieError(MovieError? movieError) {
    _movieError = movieError;
  }

  getMovies() async {
    setLoading(true);
    var response = await MovieServices.getMovies();
    debugPrint('Entered');

    if (response is Success) {
      debugPrint('Success');
      setMovieList(response.response as List<Movie>);
    }
    if (response is Failure) {
      debugPrint('Error');
      MovieError movieError = MovieError(code: response.code, message: response.errorResponse);
      setMovieError(movieError);
    }
    setLoading(false);
  }
}
