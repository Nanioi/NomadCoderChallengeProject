import 'package:final_project/models/movie_model.dart';
import 'package:final_project/services/api_service.dart';
import 'package:final_project/widgets/movie_widget.dart';
import 'package:final_project/widgets/popular_movie_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> populars = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowPlayings = ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> comingSoons = ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Popular Movies',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 180,
              child: FutureBuilder(
                future: populars,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return makePopularList(snapshot);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 30, 15, 15),
              child: Text(
                'Now in Cinemas',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder(
                future: nowPlayings,
                builder: (context, snapshot) {
                  //snapshot을 통해 future의 상태를 알 수 있다.
                  if (snapshot.hasData) {
                    return makeList(snapshot);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 10, 15, 15),
              child: Text(
                'Coming soon',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
            SizedBox(
              height: 250,
              child: FutureBuilder(
                future: comingSoons,
                builder: (context, snapshot) {
                  //snapshot을 통해 future의 상태를 알 수 있다.
                  if (snapshot.hasData) {
                    return makeList(snapshot);
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView makePopularList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return PopularMovieWidget(movie: movie);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 13),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return MovieWidget(movie: movie);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    );
  }
}
