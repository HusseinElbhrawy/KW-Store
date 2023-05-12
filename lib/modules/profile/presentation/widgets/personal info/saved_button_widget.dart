import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/injector.dart';
import '../../../../../core/usecase/params/params.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../bloc/profile_bloc.dart';

class SavedButtonWidget extends StatelessWidget {
  const SavedButtonWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listenWhen: (previous, current) {
        return previous.updateProfileDataRequestState !=
            current.updateProfileDataRequestState;
      },
      listener: (context, state) {
        if (state.updateProfileDataRequestState == RequestState.loaded) {
          serviceLocator<ProfileBloc>().add(GetProfileDataEvent());

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red.shade600,
              content: const Text('Profile updated'),
            ),
          );

          Future.delayed(const Duration(seconds: 2, milliseconds: 500), () {
            Navigator.pop(context);
          });
        } else if (state.updateProfileDataRequestState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.red.shade600,
              content: Text(state.updateProfileDataErrorMessage.toString()),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.updateProfileDataRequestState) {
          case RequestState.initial:
          case RequestState.loaded:
          case RequestState.error:
            return Padding(
              padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(context.width, AppDimensions.height45(context)),
                ),
                onPressed: () {
                  final data = UpdateProfileParams(
                    name: nameController.text,
                    email: emailController.text,
                    phone: phoneController.text,
                  );
                  context.read<ProfileBloc>().add(
                        UpdateProfileDataEvent(
                          profileData: data,
                        ),
                      );
                },
                child: const Text('Update'),
              ),
            );

          case RequestState.loading:
            return Padding(
              padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(
                    context.width,
                    AppDimensions.height45(context),
                  ),
                ),
                onPressed: null,
                child: const CircularProgressIndicator(),
              ),
            );
        }
      },
    );
  }
}
