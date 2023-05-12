import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/widgets/loading_button_widget.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/auth_bloc.dart';

class LoginAuthButtonWidget extends StatelessWidget {
  const LoginAuthButtonWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _formKey = formKey,
        _emailController = emailController,
        _passwordController = passwordController;

  final GlobalKey<FormState> _formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (previous, current) {
        return previous.loginState != current.loginState;
      },
      listener: (context, state) {
        if (state.loginState == RequestState.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: SmallTextWidget(
                state.loginErrorMessage,
                maxLines: null,
                overflow: TextOverflow.visible,
              ),
            ),
          );
          log('${AppStrings.errorHappen}${state.loginErrorMessage}');
        }
      },
      builder: (context, state) {
        switch (state.loginState) {
          case RequestState.initial:
          case RequestState.loading:
            return const LoadingButtonWidget(isUsedWithLoginScreen: true);
          case RequestState.loaded:
          case RequestState.error:
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: AppConstant.defaultButtonSize(context),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  BlocProvider.of<AuthBloc>(context).add(
                    LoginWithEmailAndPasswordEvent(
                      _emailController.text,
                      _passwordController.text,
                      context,
                    ),
                  );
                }
              },
              child: SmallTextWidget(
                AppStrings.login(context),
                color: Theme.of(context).textTheme.bodySmall!.color,
              ),
            );
        }
      },
    );
  }
}
