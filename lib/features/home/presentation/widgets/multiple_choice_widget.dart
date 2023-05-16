import 'package:crossover_app/features/home/domain/entities/mcq_entity.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:crossover_app/features/home/presentation/widgets/options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultipleChoiceWidget extends StatelessWidget {
  final McqEntity mcqEntity;
  final VoidCallback onTap;

  const MultipleChoiceWidget(
      {super.key, required this.mcqEntity, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Spacer(),
        Text(
          mcqEntity.question ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        OptionsWidget(
            options: mcqEntity.options ?? [],
            correctOptions: bloc.state.correctOptions,
            onTap: onTap),
        const Spacer(),
        Text(mcqEntity.user?.name ?? '',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w400)),
        Text(
          mcqEntity.description ?? '',
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
