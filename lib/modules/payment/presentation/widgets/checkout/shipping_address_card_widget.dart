// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/config/router/app_routes.dart';
import 'package:kw_store/core/utils/app_strings.dart';
import 'package:kw_store/core/utils/media_query_values.dart';

import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/fonts_manager.dart';
import '../../../../../core/widgets/small_text_widget.dart';
import '../../../../profile/presentation/bloc/profile_bloc.dart';

class ShippingAddressCardWidget extends StatelessWidget {
  const ShippingAddressCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(AppConstant.defaultPadding(context)),
      color: Theme.of(context).cardColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppConstant.defaultPadding(context),
                  vertical: AppConstant.defaultPadding(context) / 2,
                ),
                child: const Icon(Icons.local_shipping_outlined),
              ),
              const SmallTextWidget(
                AppStrings.shippingAddress,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.jannah,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  context.navigateTo(Routes.addressRoute);
                  //Todo : Edit Shipping Address (Nav to Address Screen)
                },
                icon: const Icon(Icons.edit),
              ),
            ],
          ),
          const Divider(),
          if (context.watch<ProfileBloc>().state.address?.isEmpty ?? true) ...[
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: AppConstant.defaultPadding(context),
                horizontal: AppConstant.defaultPadding(context) / 2,
              ),
              child: const SmallTextWidget(
                'Please add your shipping address',
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.jannah,
                color: Colors.red,
              ),
            ),
          ],
          if (context.watch<ProfileBloc>().state.address?.isNotEmpty ??
              false) ...[
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.defaultPadding(context),
                vertical: AppConstant.defaultPadding(context) / 2,
              ),
              child: Row(
                children: [
                  const SmallTextWidget(
                    AppStrings.name,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.jannah,
                  ),
                  const Spacer(),
                  SmallTextWidget(
                    context
                        .read<ProfileBloc>()
                        .state
                        .profile!
                        .data!
                        .name
                        .toString(),
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.jannah,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.defaultPadding(context),
                vertical: AppConstant.defaultPadding(context) / 2,
              ),
              child: Row(
                children: [
                  const SmallTextWidget(
                    AppStrings.address,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.jannah,
                  ),
                  const Spacer(),
                  SmallTextWidget(
                    context
                        .read<ProfileBloc>()
                        .state
                        .defaultAddress!
                        .region
                        .toString(),
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.jannah,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppConstant.defaultPadding(context),
                vertical: AppConstant.defaultPadding(context) / 2,
              ),
              child: Row(
                children: [
                  const SmallTextWidget(
                    AppStrings.phoneNumber,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.jannah,
                  ),
                  const Spacer(),
                  SmallTextWidget(
                    context
                        .read<ProfileBloc>()
                        .state
                        .profile!
                        .data!
                        .phone
                        .toString(),
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.jannah,
                  ),
                ],
              ),
            ),
          ]
        ],
      ),
    );
  }
}
