import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../bloc/auth_bloc.dart';

class PasswordLoginTFFWidget extends StatelessWidget {
  const PasswordLoginTFFWidget({
    super.key,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
    required TextEditingController emailController,
  })  : _passwordController = passwordController,
        _emailController = emailController,
        _formKey = formKey;

  final TextEditingController _passwordController;
  final TextEditingController _emailController;
  final GlobalKey<FormState> _formKey;

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
          onEditingComplete: () {
            if (_formKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();

              BlocProvider.of<AuthBloc>(context).add(
                LoginWithEmailAndPasswordEvent(
                  _emailController.text,
                  _passwordController.text,
                  context,
                ),
              );
            }
          },
          keyboardType: TextInputType.visiblePassword,
          obscureText: state.isPassword,
          textInputAction: TextInputAction.done,
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
