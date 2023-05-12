import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/widgets/app_custom_animation_widget.dart';
import '../../../../../core/widgets/big_text_widget.dart';
import '../../bloc/profile_bloc.dart';

class AddressInformationWidget extends StatelessWidget {
  const AddressInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AppCustomAnimationWidget(
        padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
        children: [
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return DropdownButtonFormField(
                value: state.addressType ?? 'Home 🏠',
                items: [
                  DropdownMenuItem(
                    value: 'Home 🏠',
                    child: Text('${AppStrings.homeAddress(context)} 🏠'),
                  ),
                  DropdownMenuItem(
                    value: 'Work 💼',
                    child: Text('${AppStrings.workAddress(context)}💼'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text(AppStrings.otherAddress(context)),
                  ),
                ],
                autofocus: true,
                onSaved: (newValue) {
                  context
                      .read<ProfileBloc>()
                      .add(AssignAddressType(addressType: newValue!));
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null) {
                    return 'pleaseSelectAddressType';
                  }
                  return null;
                },
                onChanged: (newValue) {
                  context
                      .read<ProfileBloc>()
                      .add(AssignAddressType(addressType: newValue!));
                },
              );
            },
          ),
          AppConstant.horizontalDivider(),
          BigTextWidget(
            AppStrings.addressDetails(context),
            fontWeight: FontWeight.w600,
            size: AppDimensions.font20(context),
          ),
          TextFormField(
            controller: context.read<ProfileBloc>().addressDetailsController,
            maxLines: 2,
            decoration: InputDecoration(
              hintText: AppStrings.fullAddressDetails(context),
            ),
          ),
          AppConstant.horizontalDivider(),
          BigTextWidget(
            AppStrings.notes(context),
            size: AppDimensions.font20(context),
            fontWeight: FontWeight.w600,
          ),
          TextFormField(
            maxLines: 3,
            maxLength: 100,
            controller: context.read<ProfileBloc>().notesController,
            decoration: InputDecoration(
              hintText: AppStrings.addNotesForDelivery(context),
            ),
          ),
        ],
      ),
    );
  }
}
