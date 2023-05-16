import 'package:crossover_app/constants/colors.dart';
import 'package:crossover_app/features/home/domain/entities/option_entity.dart';
import 'package:flutter/material.dart';

class OptionsWidget extends StatelessWidget {
  final List<OptionEntity> options;
  final List<OptionEntity> correctOptions;
  final VoidCallback onTap;

  const OptionsWidget(
      {super.key,
      required this.options,
      required this.correctOptions,
      required this.onTap});

  Widget _buildOption(BuildContext context, OptionEntity option) {
    final isCorrect =
        correctOptions.any((element) => option.answer == element.answer);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isCorrect
                ? CustomColors.lightIlluminatingEmerald
                : Colors.white24),
        child: Text(option.answer ?? '',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w400)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) => _buildOption(context, options[index]),
    );
  }
}
