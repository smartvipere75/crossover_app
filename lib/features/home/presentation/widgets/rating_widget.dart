import 'package:crossover_app/constants/colors.dart';
import 'package:crossover_app/features/home/presentation/widgets/rating_item.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  const RatingWidget({super.key});

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  Widget _buildItem(String title, Color color) {
    return RatingItem(title: title, color: color);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildItem('1', CustomColors.mustard),
        const SizedBox(width: 5),
        _buildItem('2', CustomColors.mellowApricot),
        const SizedBox(width: 5),
        _buildItem('3', CustomColors.mustard),
        const SizedBox(width: 5),
        _buildItem('4', CustomColors.darkGreen),
        const SizedBox(width: 5),
        _buildItem('5', CustomColors.illuminatingEmerald)
      ],
    );
  }
}
