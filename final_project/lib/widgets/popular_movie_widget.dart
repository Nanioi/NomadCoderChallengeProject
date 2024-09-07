import 'package:final_project/models/movie_model.dart';
import 'package:final_project/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class PopularMovieWidget extends StatelessWidget {
  final MovieModel movie;

  const PopularMovieWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              movie: movie,
            ),
            // fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        width: 240,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //       blurRadius: 15,
          //       offset: const Offset(10, 10),
          //       color: Colors.black.withOpacity(0.5))
          // ],
        ),
        clipBehavior: Clip.hardEdge, // 경계선을 넘지 않도록 설정
        child: Image.network(
          'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
          headers: const {
            "User-Agent":
                "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
          },
          fit: BoxFit.cover, // 이미지가 Container 영역을 채우도록 설정
        ),
      ),
    );
  }
}
