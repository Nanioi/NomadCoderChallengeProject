import 'package:day11project/theme/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ItemBtn extends StatelessWidget {
  final int text;
  final int index;
  final bool isSelected;

  const ItemBtn(this.text, this.index, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 30,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: isSelected
                ? Colors.transparent
                : AppColors.colorWhite.withOpacity(0.5),
            width: 4),
      ),
      child: Center(
        child: Text(
          '$text',
          style: TextStyle(
              color: isSelected
                  ? AppColors.colorRed
                  : Colors.white.withOpacity(0.8),
              fontSize: 23,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
