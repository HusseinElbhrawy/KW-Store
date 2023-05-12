import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../bloc/home_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        log(state.toString(), error: state);

        switch (state.homeProductsState) {
          case RequestState.initial:
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          case RequestState.loaded:
            return Center(
              child: Text(
                state.homeProductsData.toString(),
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
            );
          case RequestState.error:
            return Center(
              child: BigTextWidget(state.homeProductsErrorMessage.toString()),
            );
        }
      },
    );
  }
}
