import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/constant.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../core/utils/media_query_values.dart';
import '../../../../../core/widgets/big_text_widget.dart';
import '../../../domain/entities/address.dart';
import '../../bloc/profile_bloc.dart';

class SaveNewAddressButtonWidget extends StatelessWidget {
  const SaveNewAddressButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return AnimatedCrossFade(
          crossFadeState:
              state.getCurrentLocationRequestState == RequestState.loading ||
                      state.currentLocationData == null ||
                      state.placeMarks == null ||
                      state.locationData == null
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 500),
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
            child: ElevatedButton(
              onPressed: () {
                final profile = context.read<ProfileBloc>();

                if (state.locationData != null) {
                  final address = Address(
                    street: profile.placeController.text,
                    region: profile.cityController.text,
                    state: profile.stateController.text,
                    fullAddress: profile.addressDetailsController.text,
                    note: profile.notesController.text,
                    latitude: state.locationData!.latitude,
                    longitude: state.locationData!.longitude,
                    type: state.addressType ?? 'Home 🏠',
                  );

                  profile.add(AddNewAddressEvent(address: address));
                  profile.add(GetAddressesEvent());
                  if (state.address!.isEmpty) {
                    profile.add(SetDefaultAddressEvent(address: address));
                  }
                  context.pop();
                }
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(
                  context.width,
                  context.responsiveHeight(40),
                ),
              ),
              child: BigTextWidget(
                AppStrings.save,
                size: AppDimensions.font20(context),
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
