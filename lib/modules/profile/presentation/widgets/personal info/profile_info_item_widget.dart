import 'package:flutter/material.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class ProfileInfoItemWidget extends StatelessWidget {
  const ProfileInfoItemWidget({
    super.key,
    required this.title,
    required this.controller,
    this.enabled,
  });
  final String title;
  final TextEditingController controller;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SmallTextWidget(title, size: AppDimensions.font16(context)),
          SizedBox(height: AppDimensions.height10(context)),
          TextFormField(
            controller: controller,
            enabled: enabled,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: enabled! ? Colors.black : Colors.grey,
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: enabled! ? Colors.black : Colors.grey,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: enabled! ? Colors.black : Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: enabled! ? Colors.black : Colors.grey,
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: enabled! ? Colors.black : Colors.grey,
                ),
              ),
              disabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: enabled! ? Colors.black : Colors.grey,
                ),
              ),
              hintText: title,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
