import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../widgets/login/email_login_tff_widget.dart';
import '../widgets/login/login_auth_button_widget.dart';
import '../widgets/login/login_have_not_an_account_widget.dart';
import '../widgets/login/login_remember_me_widget.dart';
import '../widgets/login/password_login_tff_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: AppCustomAnimationWidget(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: AppDimensions.height45(context) * 2.5,
                bottom: AppDimensions.height45(context),
              ),
              child: SvgPicture.asset(
                AppSvgAssets.appLogo,
                color: Theme.of(context).textTheme.headlineLarge!.color,
              ),
            ),
            BigTextWidget(
              AppStrings.loginToYourAccount(context),
              align: TextAlign.center,
              fontWeight: AppFontsWeight.bold,
            ),
            SizedBox(height: AppDimensions.height45(context)),
            EmailLoginTFFWidget(emailController: _emailController),
            AppConstant.horizontalDivider(),
            PasswordLoginTFFWidget(
              passwordController: _passwordController,
              emailController: _emailController,
              formKey: _formKey,
            ),
            AppConstant.horizontalDivider(),
            const LoginRememberMeWidget(),
            AppConstant.horizontalDivider(),
            LoginAuthButtonWidget(
              formKey: _formKey,
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            AppConstant.horizontalDivider(),
            Align(
              alignment: AlignmentDirectional.center,
              child: TextButton(
                onPressed: () {},
                child: SmallTextWidget(AppStrings.resetPassword(context)),
              ),
            ),
            SizedBox(height: AppDimensions.height45(context) * 2),
            const LoginHaveNotAnAccountWidget(),
          ],
        ),
      ),
    );
  }
}
