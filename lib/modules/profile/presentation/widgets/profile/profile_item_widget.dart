import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:kw_store/core/utils/media_query_values.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/big_text_widget.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.bgColor,
    required this.iconColor,
    this.trailing,
    this.onTap,
    this.badgeCount = 0,
    this.isBadgeVisible = false,
  });
  final String title;
  final IconData icon;
  final Color bgColor, iconColor;
  final Widget? trailing;
  final VoidCallback? onTap;
  final int badgeCount;
  final bool isBadgeVisible;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppConstant.defaultPadding(context) / 2,
      ),
      child: TextButton(
        onPressed: onTap,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(
                AppConstant.defaultPadding(context) / 1.5,
              ),
              margin: EdgeInsetsDirectional.only(
                start: AppConstant.defaultPadding(context),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bgColor,
              ),
              child: Badge.count(
                count: badgeCount,
                isLabelVisible: isBadgeVisible,
                backgroundColor: Colors.red,
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
            AppConstant.verticalDivider(),
            BigTextWidget(
              title,
              size: AppDimensions.font20(context),
              fontWeight: AppFontsWeight.medium,
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: AppConstant.defaultPadding(context),
              ),
              child: trailing ??
                  Icon(
                    IconlyLight.arrowRight2,
                    color: context.theme.iconTheme.color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
