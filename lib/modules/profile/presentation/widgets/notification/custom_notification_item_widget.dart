import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/widgets/big_text_widget.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../../domain/entities/notification.dart';

class CustomNotificationItemWidget extends StatelessWidget {
  const CustomNotificationItemWidget({
    super.key,
    required this.notification,
  });
  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppConstant.defaultPadding(context) / 2),
      padding: EdgeInsets.all(AppConstant.defaultPadding(context) / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor.withOpacity(.09),
        borderRadius: BorderRadius.circular(
          AppConstant.defaultPadding(context) / 1.25,
        ),
      ),
      child: ListTile(
        leading: const Icon(LineAwesomeIcons.bell),
        title: BigTextWidget(
          notification.title,
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
        subtitle: SmallTextWidget(
          notification.message,
          maxLines: null,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
