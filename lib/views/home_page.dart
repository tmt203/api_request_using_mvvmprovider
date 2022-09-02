import 'package:api_request/components/app_loading.dart';
import 'package:api_request/view_model/movies_view_model.dart';
import 'package:api_request/views/app_error.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  _ui(MoviesViewModel moviesViewModel) {
    if (moviesViewModel.loading) {
      return const AppLoading();
    }
    if (moviesViewModel.movieError != null) {
      return AppError(errorText: moviesViewModel.movieError!.message.toString());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: GridView.builder(
        itemCount: moviesViewModel.movieList.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => CachedNetworkImage(
          imageUrl: moviesViewModel.movieList[index].coverUrl.toString(),
          placeholder: (context, url) => Container(color: Colors.red),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var moviesViewModel = context.watch<MoviesViewModel>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 48, 48),
      body: _ui(moviesViewModel),
    );
  }
}
