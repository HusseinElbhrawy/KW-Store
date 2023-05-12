// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import 'custom_about_button_widget.dart';

class ContactMeWidget extends StatelessWidget {
  const ContactMeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomAboutButtonWidget(
          icon: Icons.facebook,
          color: Colors.blue,
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(AppConstant.facebookLink))) {
              await launchUrl(Uri.parse(AppConstant.facebookLink));
            } else {
              await launchUrl(Uri.parse(AppConstant.facebookLink));
            }
          },
        ),
        CustomAboutButtonWidget(
          icon: LineAwesomeIcons.what_s_app,
          color: Colors.green,
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(AppConstant.whatsappUrl))) {
              await launchUrl(Uri.parse(AppConstant.whatsappUrl));
            } else {
              MotionToast.error(
                title: const Text(AppStrings.error),
                description: const Text(
                  AppStrings.whatsAppNotInstalled,
                ),
              ).show(context);
            }
          },
        ),
        CustomAboutButtonWidget(
          icon: LineAwesomeIcons.linkedin,
          color: Colors.blue,
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(AppConstant.linkedInLink))) {
              await launchUrl(Uri.parse(AppConstant.linkedInLink));
            } else {
              await launchUrl(Uri.parse(AppConstant.linkedInLink));
            }
          },
        ),
        CustomAboutButtonWidget(
          icon: LineAwesomeIcons.github,
          color: Colors.black,
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(AppConstant.githubLink))) {
              await launchUrl(Uri.parse(AppConstant.githubLink));
            } else {
              await launchUrl(Uri.parse(AppConstant.githubLink));
            }
          },
        ),
        CustomAboutButtonWidget(
          icon: LineAwesomeIcons.code,
          color: Colors.blue,
          onPressed: () async {
            if (await canLaunchUrl(Uri.parse(AppConstant.websiteLink))) {
              await launchUrl(Uri.parse(AppConstant.websiteLink));
            } else {
              await launchUrl(Uri.parse(AppConstant.websiteLink));
            }
          },
        ),
      ],
    );
  }
}
