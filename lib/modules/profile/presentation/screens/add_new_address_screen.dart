import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/enums.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../bloc/profile_bloc.dart';
import '../widgets/add new address/address_information_widget.dart';
import '../widgets/add new address/custom_map_widget.dart';
import '../widgets/add new address/save_new_address_button_widget.dart';

class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}

class _AddNewAddressScreenState extends State<AddNewAddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const SaveNewAddressButtonWidget(),
      appBar: AppBar(
        centerTitle: false,
        title: SmallTextWidget(
          AppStrings.addNewAddress(context),
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
        ),
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listenWhen: (previous, current) {
          return previous.getCurrentLocationRequestState !=
                  current.getCurrentLocationRequestState ||
              previous.getCurrentAddressRequestState !=
                  current.getCurrentAddressRequestState;
        },
        listener: (context, state) {
          if (state.getCurrentLocationRequestState == RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.getCurrentLocationErrorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          } else if (state.getCurrentAddressRequestState ==
              RequestState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.getCurrentAddressErrorMessage!),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.getCurrentLocationRequestState == RequestState.loading ||
              state.getCurrentAddressRequestState == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.getCurrentLocationRequestState ==
                  RequestState.error ||
              state.getCurrentAddressRequestState == RequestState.error) {
            return Padding(
              padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
              child: Center(
                child: SmallTextWidget(
                  state.getCurrentAddressErrorMessage ??
                      state.getCurrentLocationErrorMessage ??
                      'Error Occurred',
                  overflow: TextOverflow.visible,
                ),
              ),
            );
          } else {
            return Column(
              children: [
                CustomMapWidget(state: state),
                if (state.locationData != null && state.placeMarks != null)
                  const AddressInformationWidget(),
              ],
            );
          }
        },
      ),
    );
  }
}
