import 'package:final_project/models/movie_detail_model.dart';
import 'package:final_project/models/movie_model.dart';
import 'package:final_project/services/api_service.dart';
import 'package:final_project/widgets/rating_widget';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatefulWidget {
  final MovieModel movie;

  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late final Future<MovieDetailModel> details;

  @override
  void initState() {
    super.initState();
    details = ApiService.getMovieDetailById(widget.movie.id);
  }

  onButtonTap(String url) async {
    // final url = Uri.parse("https://google.com");
    // await launchUrl(url);
    await launchUrlString(url);
  }

  String formatDuration(int minutes) {
    int hours = minutes ~/ 60; // 정수 나눗셈으로 시간을 계산
    int remainingMinutes = minutes % 60; // 나머지로 분 계산

    return '${hours}h ${remainingMinutes}min';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: details,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var detail = snapshot.data!;
              return Stack(
                children: [
                  // Poster image as background
                  Positioned.fill(
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${detail.poster}',
                      fit: BoxFit.cover, // 이미지가 화면 전체를 덮도록 설정
                    ),
                  ),

                  // Overlay to darken the background slightly for better readability
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.5), // 약간 어둡게 덮음
                    ),
                  ),

                  // AppBar on top of the background
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: AppBar(
                      backgroundColor: Colors.transparent, // 투명하게 만듦
                      elevation: 0,
                      foregroundColor: Colors.white,
                      title: const Text(
                        'Back to list',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      centerTitle: false,
                    ), // 그림자 제거
                  ),

                  // Content over the background
                  Positioned(
                    top: 400, // AppBar 높이만큼 아래로 이동
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              detail.title,
                              style: const TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            RatingWidget(rating: detail.vote),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  formatDuration(detail.runtime),
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 20),
                                  width: 1,
                                  height: 10,
                                  color: Colors.white.withOpacity(0.8),
                                ),
                                Text(
                                  getGenresText(detail.genres),
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Storyline',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Text(
                              detail.overview,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 80), // 버튼과 내용 사이의 간격
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () => onButtonTap(detail.site),
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black,
                                        backgroundColor: Colors.yellow, // 글씨색
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              10), // 라운드 처리
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 30), // 버튼의 패딩
                                      ),
                                      child: const Text(
                                        'Buy ticket',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  String getGenresText(List<Map<String, dynamic>> genres) {
    List<String> genreNames = [];

    for (var g in genres) {
      genreNames.add(g['name']);
    }

    return genreNames.join(', ');
  }
}
