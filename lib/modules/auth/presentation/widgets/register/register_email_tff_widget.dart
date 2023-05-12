import 'package:flutter/material.dart';
import '../../../../../core/utils/validator.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class RegisterEmailTFFWidget extends StatelessWidget {
  const RegisterEmailTFFWidget({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (!Validator.validateEmail(value!)) {
          return AppStrings.emailValidationMessage;
        }
        return null;
      },
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: 'hussein@gmail.com',
        label: SmallTextWidget(AppStrings.emailAddress),
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );
  }
}