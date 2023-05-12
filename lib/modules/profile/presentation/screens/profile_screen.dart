import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/injector.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/error_screen_widget.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/profile/profile_loaded_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          switch (state.getProfileDataRequestState) {
            case RequestState.initial:
            case RequestState.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case RequestState.loaded:
              return ProfileLoadedWidget(profile: state.profile!);
            case RequestState.error:
              return ErrorScreenWidget(
                errorMessage: state.getProfileDataErrorMessage,
                onRetry: () {
                  serviceLocator<ProfileBloc>()
                    ..add(GetProfileDataEvent())
                    ..add(GetNotificationDataEvent())
                    ..add(GetFAQsDataEvent())
                    ..add(GetAddressesEvent());
                },
              );
          }
        },
      ),
    );
  }
}
