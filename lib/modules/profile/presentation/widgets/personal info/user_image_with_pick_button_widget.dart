import 'package:flutter/material.dart';
import 'package:kw_store/core/utils/app_strings.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/widgets/small_text_widget.dart';

class UserImageWithPickButtonWidget extends StatelessWidget {
  const UserImageWithPickButtonWidget({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(image),
            radius: context.responsiveWidth(50),
            backgroundColor: Colors.transparent,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.all(context.responsiveWidth(5)),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: EdgeInsets.all(context.responsiveWidth(2.5)),
                child: InkWell(
                  onTap: () {
                    MotionToast.info(
                      description: const SmallTextWidget(AppStrings.comingSoon),
                      toastDuration: const Duration(seconds: 2),
                    ).show(context);
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
