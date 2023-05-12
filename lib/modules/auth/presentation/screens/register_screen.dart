import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/fonts_manager.dart';
import '../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../core/widgets/big_text_widget.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/register/register_already_have_an_account.dart';
import '../widgets/register/register_button_widget.dart';
import '../widgets/register/register_email_tff_widget.dart';
import '../widgets/register/register_logo_widget.dart';
import '../widgets/register/register_name_tff_widget.dart';
import '../widgets/register/register_password_tff_widget.dart';
import '../widgets/register/register_phone_tff_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: AppCustomAnimationWidget(
          children: [
            const RegisterLogoWidget(),
            BigTextWidget(
              AppStrings.registerToStart(context),
              fontWeight: AppFontsWeight.bold,
              align: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.height45(context)),
            RegisterNameTFFWidget(nameController: _nameController),
            AppConstant.horizontalDivider(),
            RegisterEmailTFFWidget(emailController: _emailController),
            AppConstant.horizontalDivider(),
            RegisterPasswordTFFWidget(passwordController: _passwordController),
            AppConstant.horizontalDivider(),
            RegisterPhoneTFFWidget(phoneController: _phoneController),
            AppConstant.horizontalDivider(),
            RegisterButtonWidget(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                        RegisterWithEmailAndPasswordEvent(
                          _emailController.text,
                          _passwordController.text,
                          _nameController.text,
                          _phoneController.text,
                          context,
                        ),
                      );
                }
              },
            ),
            AppConstant.horizontalDivider(),
            const RegisterAlreadyHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
