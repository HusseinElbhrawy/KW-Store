import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../config/router/app_routes.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/utils/utils.dart';
import '../../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../../core/widgets/big_text_widget.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../../../home/presentation/bloc/home_bloc.dart';
import '../../../../splash/presentation/bloc/splash_bloc.dart';
import '../../../domain/entities/profile.dart';
import '../../bloc/profile_bloc.dart';
import 'profile_item_widget.dart';

class ProfileLoadedWidget extends StatelessWidget {
  const ProfileLoadedWidget({
    super.key,
    required this.profile,
  });
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppCustomAnimationWidget(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
            child: BigTextWidget(
              AppStrings.profile(context),
              fontWeight: AppFontsWeight.medium,
              size: AppDimensions.font20(context),
            ),
          ),
          Container(
            margin: EdgeInsets.all(
              AppConstant.defaultPadding(context),
            ),
            padding: EdgeInsets.symmetric(
              vertical: AppConstant.defaultPadding(context),
              horizontal: AppConstant.defaultPadding(context) / 2,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor.withOpacity(.05),
              borderRadius:
                  BorderRadius.circular(AppDimensions.width30(context)),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: AppDimensions.width30(context) * 2,
                backgroundColor: Theme.of(context).primaryColor,
                backgroundImage: NetworkImage(profile.data!.image.toString()),
              ),
              title: SmallTextWidget(
                profile.data!.name.toString(),
                size: AppDimensions.font20(context),
                fontWeight: AppFontsWeight.bold,
              ),
              subtitle: SmallTextWidget(profile.data!.email.toString()),
            ),
          ),
          ProfileItemWidget(
            bgColor: Colors.orange.shade50,
            icon: LineAwesomeIcons.user,
            title: AppStrings.personalInfo(context),
            iconColor: Colors.orange.shade300,
            onTap: () {
              context.navigateToWithArguments(
                Routes.profileInfoRoute,
                profile,
              );
            },
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return ProfileItemWidget(
                bgColor: Colors.blue.shade50,
                icon: LineAwesomeIcons.bell,
                title: AppStrings.notification(context),
                isBadgeVisible: state.notifications!.data!.data.isNotEmpty,
                badgeCount: state.notifications!.data!.data.length,
                iconColor: Colors.blue.shade300,
                onTap: () {
                  context.navigateTo(Routes.notificationRoute);
                },
              );
            },
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return ProfileItemWidget(
                bgColor: Colors.pink.shade50,
                icon: LineAwesomeIcons.map_marker,
                title: AppStrings.address(context),
                isBadgeVisible: state.address?.isNotEmpty ?? false,
                badgeCount: state.address?.length ?? 0,
                iconColor: Colors.pink.shade300,
                onTap: () {
                  context.navigateTo(Routes.addressRoute);
                },
              );
            },
          ),
          ProfileItemWidget(
            bgColor: Colors.purple.shade50,
            icon: LineAwesomeIcons.shopping_bag,
            title: AppStrings.orders(context),
            isBadgeVisible: true,
            badgeCount: 1,
            iconColor: Colors.purple.shade300,
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return ProfileItemWidget(
                bgColor: Colors.red.shade50,
                icon: LineAwesomeIcons.heart,
                title: AppStrings.wishlist(context),
                isBadgeVisible: state.getFavoriteDataData!.data.data.isNotEmpty,
                badgeCount: state.getFavoriteDataData!.data.data.length,
                iconColor: Colors.red.shade300,
                onTap: () {
                  context.navigateTo(Routes.favoritesRoute);
                },
              );
            },
          ),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return ProfileItemWidget(
                bgColor: Colors.cyan.shade50,
                icon: LineAwesomeIcons.shopping_cart,
                title: AppStrings.cart(context),
                isBadgeVisible: state.getCartDataData!.data.products.isNotEmpty,
                badgeCount: state.getCartDataData!.data.products.length,
                iconColor: Colors.cyan.shade300,
                onTap: () {
                  context.navigateTo(Routes.cartRoute);
                },
              );
            },
          ),
          ProfileItemWidget(
            bgColor: Colors.green.shade50,
            icon: LineAwesomeIcons.question_circle,
            title: AppStrings.helpAndSupport(context),
            iconColor: Colors.green.shade300,
            onTap: () {
              context.navigateTo(Routes.helpAndSupportRoute);
            },
          ),
          ProfileItemWidget(
            bgColor: Colors.purple.shade50,
            icon: LineAwesomeIcons.info_circle,
            title: AppStrings.about(context),
            iconColor: Colors.purple.shade300,
            onTap: () {
              context.navigateTo(Routes.aboutRoute);
            },
          ),
          ProfileItemWidget(
            bgColor: Colors.teal.shade50,
            icon: LineAwesomeIcons.language,
            title: AppStrings.arabic(context),
            iconColor: Colors.teal.shade300,
            trailing: BlocBuilder<SplashBloc, SplashState>(
              builder: (context, state) {
                return FlutterSwitch(
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  width: context.responsiveWidth(40),
                  height: context.responsiveHeight(20),
                  value: state.currentLang == 'en' ? false : true,
                  onToggle: (value) {
                    context
                        .read<SplashBloc>()
                        .add(ChangeLangEvent(value, context));
                    log(value.toString());
                  },
                );
              },
            ),
          ),
          ProfileItemWidget(
            bgColor: Colors.blueGrey.shade50,
            icon: LineAwesomeIcons.moon,
            title: AppStrings.darkMode(context),
            iconColor: Colors.blueGrey.shade300,
            trailing: BlocBuilder<SplashBloc, SplashState>(
              builder: (context, state) {
                return FlutterSwitch(
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                  width: context.responsiveWidth(40),
                  height: context.responsiveHeight(20),
                  value: state.isDarkMode,
                  onToggle: (value) {
                    context.read<SplashBloc>().add(ChangeThemeEvent(value));
                    log(state.isDarkMode.toString());
                  },
                );
              },
            ),
          ),
          ProfileItemWidget(
            bgColor: Colors.red.shade50,
            icon: LineAwesomeIcons.alternate_sign_out,
            title: AppStrings.logout(context),
            onTap: () {
              log('logout');
              AppUtils.showLogoutBottomSheet(context);
            },
            iconColor: Colors.red.shade300,
          ),
        ],
      ),
    );
  }
}
