import 'package:crossover_app/features/home/domain/use_cases/get_following_use_case.dart';
import 'package:crossover_app/features/home/domain/use_cases/get_for_you_use_case.dart';
import 'package:crossover_app/features/home/domain/use_cases/reveal_use_case.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_event.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_state.dart';
import 'package:crossover_app/features/home/presentation/widgets/following_section.dart';
import 'package:crossover_app/features/home/presentation/widgets/foryou_section.dart';
import 'package:crossover_app/features/home/presentation/widgets/top_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:crossover_app/config/di.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> pages = [const FollowingSection(), const ForYouSection()];

  Widget _currentPage(BuildContext context) {
    final tabIndex = context.read<HomeBloc>().state.tabIndex;
    return pages[tabIndex];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(create: (context) {
      final getFollowingUseCase = locator.get<GetFollowingUseCase>();
      final getForYouUseCase = locator.get<GetForYouUseCase>();
      final revealUseCase = locator.get<RevealUseCase>();
      final bloc =
          HomeBloc(getFollowingUseCase, getForYouUseCase, revealUseCase);
      bloc.add(LoadFollowingHomeEvent());
      bloc.add(LoadForYouHomeEvent());
      return bloc;
    }, child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            // leading: Row(
            //   children: [
            //     Icon(
            //       Icons.timer,
            //       color: Colors.white,
            //     ),
            //     Text(
            //       '10m',
            //       style: TextStyle(color: Colors.white),
            //     )
            //   ],
            // ),
            title: TopTitleWidget(),
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(0, 38, 52, 0.9),
                  Color.fromRGBO(0, 66, 94, 0.9)
                ],
              ),
            ),
            child: SafeArea(child: _currentPage(context)),
          ));
    }));
  }
}
