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
                items: const [
                  DropdownMenuItem(
                    value: 'Home 🏠',
                    child: Text('Home 🏠'),
                  ),
                  DropdownMenuItem(
                    value: 'Work 💼',
                    child: Text('Work 💼'),
                  ),
                  DropdownMenuItem(
                    value: 'Other',
                    child: Text('Other'),
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
            AppStrings.addressDetails,
            fontWeight: FontWeight.w600,
            size: AppDimensions.font20(context),
          ),
          TextFormField(
            controller: context.read<ProfileBloc>().addressDetailsController,
            maxLines: 2,
            decoration: const InputDecoration(
              hintText: AppStrings.fullAddressDetails,
            ),
          ),
          AppConstant.horizontalDivider(),
          BigTextWidget(
            AppStrings.notes,
            size: AppDimensions.font20(context),
            fontWeight: FontWeight.w600,
          ),
          TextFormField(
            maxLines: 3,
            maxLength: 100,
            controller: context.read<ProfileBloc>().notesController,
            decoration: const InputDecoration(
              hintText: AppStrings.addNotesForDelivery,
            ),
          ),
        ],
      ),
    );
  }
}
