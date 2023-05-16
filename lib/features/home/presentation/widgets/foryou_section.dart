import 'package:crossover_app/features/home/presentation/bloc/home_event.dart';
import 'package:crossover_app/features/home/presentation/widgets/home_section.dart';
import 'package:crossover_app/features/home/presentation/widgets/multiple_choice_widget.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_state.dart';
import 'package:crossover_app/features/home/presentation/widgets/side_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForYouSection extends StatelessWidget {
  const ForYouSection({super.key});

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
              bloc.add(LoadForYouHomeEvent());
            },
            onScroll: () {
              bloc.add(LoadForYouHomeEvent());
            },
            itemBuilder: (context, index) {
              final mcq = state.forYou[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                      child: MultipleChoiceWidget(
                    mcqEntity: mcq,
                    onTap: () {
                      final id = mcq.id;
                      if (id != null) {
                        context.read<HomeBloc>().add(RevealHomeEvent(id: id));
                      }
                    },
                  )),
                  SideWidget(avatarImageUrl: mcq.user?.avatar ?? '')
                ],
              );
            });
      } else {
        return Container();
      }
    });
  }
}
