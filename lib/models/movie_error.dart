import 'package:api_request/models/movie_model.dart';

class MovieError {
  int code;
  Object message;
  MovieError({required this.code, required this.message});
}
