import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  final double rating; // 별점 (예: 7.757)
  final int maxRating; // 최대 별점 (5개)

  const RatingWidget({
    super.key,
    required this.rating,
    this.maxRating = 5,
  });

  @override
  Widget build(BuildContext context) {
    int fullStars = (rating / 2).floor(); // 10점 만점 기준으로 별의 갯수를 계산
    double partialStar = (rating / 2) - fullStars;

    return Row(
      children: List.generate(maxRating, (index) {
        if (index < fullStars) {
          return const Icon(
            Icons.star,
            color: Colors.amber,
            size: 24.0,
          );
        } else if (index == fullStars && partialStar > 0) {
          return Stack(
            children: [
              const Icon(
                Icons.star,
                color: Colors.grey,
                size: 24.0,
              ),
              ClipRect(
                child: Align(
                  alignment: Alignment.centerLeft,
                  widthFactor: partialStar,
                  child: const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Icon(
            Icons.star,
            color: Colors.grey,
            size: 24.0,
          );
        }
      }),
    );
  }
}
