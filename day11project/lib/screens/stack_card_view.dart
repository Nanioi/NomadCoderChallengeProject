import 'package:day11project/theme/constant/app_colors.dart';
import 'package:flutter/material.dart';

class StackCardView extends StatelessWidget {
  final String text;
  const StackCardView({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Bottom card (smallest)
          Positioned(
            top: 0,
            child: Transform.scale(
              scale: 0.8,
              child: const TimeCardView(
                opacity: 0.4,
                text: '',
              ),
            ),
          ),
          // Middle card
          Positioned(
            top: 12,
            child: Transform.scale(
              scale: 0.9,
              child: const TimeCardView(
                opacity: 0.6,
                text: '',
              ),
            ),
          ),
          // Top card (largest)
          Positioned(
            top: 24,
            child: Transform.scale(
              scale: 1.0,
              child: TimeCardView(opacity: 1, text: text),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeCardView extends StatelessWidget {
  final double opacity;
  final String text;

  const TimeCardView({
    super.key,
    required this.text,
    required this.opacity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 160,
      decoration: BoxDecoration(
        color: AppColors.colorWhite.withOpacity(opacity),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
              color: AppColors.colorRed,
              fontSize: 60,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
