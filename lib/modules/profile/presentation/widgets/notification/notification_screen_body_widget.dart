import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/profile_bloc.dart';
import 'custom_notification_item_widget.dart';

class NotificationScreenBodyWidget extends StatelessWidget {
  const NotificationScreenBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.getNotificationDataRequestState) {
          case RequestState.initial:

          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return AppCustomAnimationWidget(
              children: List.generate(
                state.notifications!.data!.total,
                (index) => CustomNotificationItemWidget(
                  notification: state.notifications!.data!.data[index],
                ),
              ),
            );
          case RequestState.error:
            return Center(
              child: SmallTextWidget(
                state.getNotificationDataErrorMessage,
                color: Theme.of(context).colorScheme.error,
              ),
            );
        }
      },
    );
  }
}
