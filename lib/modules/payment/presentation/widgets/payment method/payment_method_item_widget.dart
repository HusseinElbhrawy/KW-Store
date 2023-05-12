import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/media_query_values.dart';

class PaymentMethodItemWidget extends StatelessWidget {
  const PaymentMethodItemWidget({
    Key? key,
    this.path,
    this.secondWidget,
    required this.value,
    required this.onChange,
    required this.groupValue,
  }) : super(key: key);
  final String? path;
  final Widget? secondWidget;
  final PaymentMethod value;
  final void Function(PaymentMethod?) onChange;
  final PaymentMethod groupValue;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppConstant.defaultPadding(context),
        ),
        side: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (path == null)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.defaultPadding(context),
                vertical: AppConstant.defaultPadding(context) / 2,
              ),
              child: secondWidget!,
            )
          else
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.defaultPadding(context),
                vertical: AppConstant.defaultPadding(context) / 2,
              ),
              child: SvgPicture.asset(
                path!,
                height: context.responsiveHeight(100),
              ),
            ),
          Radio(
            value: value,
            groupValue: groupValue,
            onChanged: onChange,
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
        ],
      ),
    );
  }
}
