import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/auth_bloc.dart';

class LoginRememberMeWidget extends StatelessWidget {
  const LoginRememberMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Checkbox(
              value: state.isRememberMeChecked,
              onChanged: (value) {
                context.read<AuthBloc>().add(RememberMeEvent(value!));
              },
              activeColor: Theme.of(context).primaryColor,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            );
          },
        ),
        const SmallTextWidget(AppStrings.rememberMe),
      ],
    );
  }
}
