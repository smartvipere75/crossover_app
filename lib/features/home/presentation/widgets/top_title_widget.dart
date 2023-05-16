import 'package:crossover_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:crossover_app/features/home/presentation/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopTitleWidget extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  TopTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            bloc.add(ChangeTabHomeEvent(tabIndex: 0));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Following',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: bloc.state.tabIndex == 0
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            bloc.add(ChangeTabHomeEvent(tabIndex: 1));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'For You',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: bloc.state.tabIndex == 1
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
          ),
        )
      ],
    );
  }
}
