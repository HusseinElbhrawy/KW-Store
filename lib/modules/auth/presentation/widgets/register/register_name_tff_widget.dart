import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/validator.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class RegisterNameTFFWidget extends StatelessWidget {
  const RegisterNameTFFWidget({
    super.key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  final TextEditingController _nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (!Validator.validateName(value!)) {
          return AppStrings.registerNameValidation(context);
        }
        return null;
      },
      controller: _nameController,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: 'HusseinElbhrawy',
        label: SmallTextWidget(AppStrings.name(context)),
        prefixIcon: Icon(Icons.person_2_outlined),
      ),
    );
  }
}
