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
          return AppStrings.registerPhoneNumberValidation(context);
        }
        return null;
      },
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: '01069233929',
        label: SmallTextWidget(AppStrings.phoneNumber(context)),
        prefixIcon: const Icon(Icons.phone_android_sharp),
      ),
    );
  }
}
