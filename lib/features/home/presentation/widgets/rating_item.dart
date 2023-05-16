import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final String title;
  final Color color;

  const RatingItem({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
          width: 44,
          height: 44,
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
          ))),
    );
  }
}
