import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class RegisterPhoneTFFWidget extends StatelessWidget {
  const RegisterPhoneTFFWidget({
    super.key,
    required TextEditingController phoneController,
  }) : _phoneController = phoneController;

  final TextEditingController _phoneController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (!Validator.validateMobile(value!)) {
          return AppStrings.registerPhoneNumberValidation;
        }
        return null;
      },
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
        hintText: '01069233929',
        label: SmallTextWidget(AppStrings.phoneNumber),
        prefixIcon: Icon(Icons.phone_android_sharp),
      ),
    );
  }
}
