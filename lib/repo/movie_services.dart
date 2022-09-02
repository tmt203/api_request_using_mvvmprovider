import 'package:api_request/models/movie_model.dart';
import 'package:api_request/repo/api_status.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  static Future<Object> getMovies() async {
    try {
      var url = Uri.parse("https://mcuapi.herokuapp.com/api/v1/movies");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return Success(code: 200, response: movieList(response.body));
      }
      return Failure(code: 100, errorResponse: "Invalid Response");
    } catch (e) {
      return Failure(code: 101, errorResponse: "Unknown Error");
    }
  }
}
