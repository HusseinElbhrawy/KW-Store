import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/widgets/loading_button_widget.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/auth_bloc.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.registerState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: SmallTextWidget(
                state.registerErrorMessage,
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        log(state.toString());
        switch (state.registerState) {
          case RequestState.initial:
          case RequestState.loading:
            return const LoadingButtonWidget();
          case RequestState.loaded:
          case RequestState.error:
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppConstant.defaultPadding(context) * 2,
              ),
              child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  fixedSize: AppConstant.defaultButtonSize(context),
                ),
                child: SmallTextWidget(
                  AppStrings.register,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
              ),
            );
        }
      },
    );
  }
}
