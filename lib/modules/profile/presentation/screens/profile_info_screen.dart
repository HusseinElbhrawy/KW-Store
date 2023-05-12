import 'package:flutter/material.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../domain/entities/profile.dart';
import '../widgets/personal info/profile_info_item_widget.dart';
import '../widgets/personal info/saved_button_widget.dart';
import '../widgets/personal info/user_image_with_pick_button_widget.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({
    Key? key,
    required this.profile,
  }) : super(key: key);
  final Profile profile;
  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.profile.data!.name!;
    phoneController.text = widget.profile.data!.phone!;
    emailController.text = widget.profile.data!.email!;
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();

    super.dispose();
  }

  bool isEdit = false;

  void toggleEdit() {
    setState(() {
      isEdit = !isEdit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: BigTextWidget(
          AppStrings.personalInfo,
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {
              toggleEdit();
            },
            icon: Icon(isEdit ? Icons.edit : Icons.edit_outlined),
          ),
        ],
      ),
      bottomNavigationBar: AnimatedCrossFade(
        firstChild: const SizedBox.shrink(),
        secondChild: SavedButtonWidget(
          nameController: nameController,
          emailController: emailController,
          phoneController: phoneController,
        ),
        crossFadeState:
            isEdit ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(
          milliseconds: AppConstant.kDefaultAnimationDuration,
        ),
      ),
      body: AppCustomAnimationWidget(
        children: [
          SizedBox(height: context.responsiveHeight(20)),
          UserImageWithPickButtonWidget(image: widget.profile.data!.image!),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppDimensions.height20(context),
            ),
            child: const Divider(
              thickness: .3,
              color: Colors.grey,
            ),
          ),
          ProfileInfoItemWidget(
            title: AppStrings.fullName,
            controller: nameController,
            enabled: isEdit,
          ),
          ProfileInfoItemWidget(
            title: AppStrings.phoneNumber,
            controller: phoneController,
            enabled: isEdit,
          ),
          ProfileInfoItemWidget(
            title: AppStrings.emailAddress,
            controller: emailController,
            enabled: isEdit,
          ),
        ],
      ),
    );
  }
}
