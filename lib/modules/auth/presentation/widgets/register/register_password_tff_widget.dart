import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/auth_bloc.dart';

class RegisterPasswordTFFWidget extends StatelessWidget {
  const RegisterPasswordTFFWidget({
    super.key,
    required TextEditingController passwordController,
  }) : _passwordController = passwordController;

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, state) {
        return TextFormField(
          validator: (value) {
            if (value!.isEmpty && value.length < 8) {
              return AppStrings.passwordValidationMessage;
            }
            return null;
          },
          controller: _passwordController,
          keyboardType: TextInputType.visiblePassword,
          obscureText: state.isPassword,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).nextFocus();
          },
          decoration: InputDecoration(
            hintText: '**********',
            label: const SmallTextWidget(AppStrings.password),
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              onPressed: () {
                context
                    .read<AuthBloc>()
                    .add(const ChangePasswordVisibilityEvent());
              },
              icon: Icon(
                state.isPassword ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
        );
      },
    );
  }
}
