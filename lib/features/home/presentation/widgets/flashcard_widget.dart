import 'package:crossover_app/features/home/domain/entities/flashcard_entity.dart';
import 'package:crossover_app/features/home/presentation/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class FlashcardWidget extends StatefulWidget {
  final FlashCardEntity flashCardEntity;

  const FlashcardWidget({super.key, required this.flashCardEntity});

  @override
  State<FlashcardWidget> createState() => _FlashcardWidgetState();
}

class _FlashcardWidgetState extends State<FlashcardWidget> {
  bool isFlipped = false;

  List<Widget> _buildContent() {
    return [
      const SizedBox(height: 16),
      const Divider(),
      const Text('Answer',
          style: TextStyle(
              color: Colors.green, fontSize: 15, fontWeight: FontWeight.w800)),
      Text(widget.flashCardEntity.flashcardBack ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 17, fontWeight: FontWeight.w400)),
      const Spacer(),
      const SizedBox(
        height: 5,
      ),
      const Text('How well did you know this?',
          style: TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400)),
      const RatingWidget()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          isFlipped = !isFlipped;
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Text(widget.flashCardEntity.flashcardFront ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w400)),
          if (isFlipped) ..._buildContent(),
          const Spacer(),
          Text(widget.flashCardEntity.user?.name ?? '',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400)),
          Text(
            widget.flashCardEntity.description ?? '',
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
