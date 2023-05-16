import 'package:crossover_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_event.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_state.dart';
import 'package:crossover_app/features/home/presentation/widgets/flashcard_widget.dart';
import 'package:crossover_app/features/home/presentation/widgets/home_section.dart';
import 'package:crossover_app/features/home/presentation/widgets/side_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FollowingSection extends StatelessWidget {
  const FollowingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      if (state is HomeLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is HomeLoadedState) {
        final bloc = context.read<HomeBloc>();
        return HomeSection(
            items: state.forYou,
            onInit: () {
              bloc.add(LoadFollowingHomeEvent());
            },
            onScroll: () {
              bloc.add(LoadFollowingHomeEvent());
            },
            itemBuilder: (context, index) {
              final flashcard = state.following[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: FlashcardWidget(
                      flashCardEntity: flashcard,
                    ),
                  ),
                  SideWidget(avatarImageUrl: flashcard.user?.avatar ?? '')
                ],
              );
            });
      } else {
        return Container();
      }
    });
  }
}
