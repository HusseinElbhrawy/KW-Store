import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/injector.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../../core/widgets/error_screen_widget.dart';
import '../../bloc/profile_bloc.dart';
import 'faqs_item_widget.dart';

class HelpAndSupportScreenBodyWidget extends StatelessWidget {
  const HelpAndSupportScreenBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.getFAQsDataRequestState) {
          case RequestState.initial:

          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return AppCustomAnimationWidget(
              padding: EdgeInsets.zero,
              children: List.generate(state.faqs!.data!.length, (index) {
                return FAQsItemWidget(
                  title: state.faqs!.data![index].question,
                  description: state.faqs!.data![index].answer,
                );
              }),
            );

          case RequestState.error:
            return ErrorScreenWidget(
              errorMessage: state.getFAQsDataErrorMessage,
              onRetry: () {
                serviceLocator<ProfileBloc>().add(GetFAQsDataEvent());
              },
            );
        }
      },
    );
  }
}
