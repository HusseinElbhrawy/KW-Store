import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:kw_store/core/utils/app_strings.dart';

import '../../../../config/router/app_routes.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/media_query_values.dart';
import '../../../../core/widgets/empty_widget.dart';
import '../../../../core/widgets/slidable_delete_widget.dart';
import '../../../../core/widgets/small_text_widget.dart';
import '../../domain/entities/address.dart';
import '../bloc/profile_bloc.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: SmallTextWidget(
          AppStrings.address(context),
          size: AppDimensions.font20(context),
          fontWeight: FontWeight.w600,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          context.navigateTo(Routes.addNewAddressRoute);
          // context.read<ProfileBloc>().add(GetAddressesEvent());
          // final ILocalDataBase localDataBase = serviceLocator<ILocalDataBase>();
          // final value = await localDataBase.get(AppConstant.defaultAddress);
          // log(value.toString());
        },
        child: const Icon(
          IconlyBold.plus,
          color: Colors.white,
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.address == null || state.address!.isEmpty) {
            return EmptyWidget(
              title: AppStrings.noAddressFound(context),
              subTitle: AppStrings.pleaseAddYourAddress(context),
            );
          } else {
            return ListView.builder(
              itemCount: state.address?.length ?? 0,
              itemBuilder: (context, index) {
                return Slidable(
                  key: Key(state.address![index].key.toString()),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(
                      onDismissed: () {
                        context.read<ProfileBloc>().add(
                            DeleteAddressEvent(address: state.address![index]));
                      },
                    ),
                    extentRatio: .4,
                    children: [
                      SlidableDeleteWidget(index: index),
                    ],
                  ),
                  child: AddressItemWidget(
                    address: state.address![index],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class AddressItemWidget extends StatelessWidget {
  const AddressItemWidget({
    super.key,
    required this.address,
  });
  final Address address;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: AppConstant.defaultPadding(context) / 2.5,
        horizontal: AppConstant.defaultPadding(context),
      ),
      padding: EdgeInsets.symmetric(
        vertical: AppConstant.defaultPadding(context),
        horizontal: AppConstant.defaultPadding(context) / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          AppConstant.defaultPadding(context),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: AppConstant.defaultPadding(context) / 2,
              end: AppConstant.defaultPadding(context),
            ),
            child: CircleAvatar(
              radius: context.responsiveWidth(25),
              backgroundColor: Colors.brown.shade50,
              child: CircleAvatar(
                backgroundColor: Colors.brown.shade300,
                radius: context.responsiveWidth(20),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SmallTextWidget(
                  address.type.contains('Home')
                      ? '${AppStrings.homeAddress(context)}🏠'
                      : address.type.contains('Work')
                          ? '${AppStrings.workAddress(context)}💼'
                          : AppStrings.otherAddress(context),
                  size: AppDimensions.font20(context),
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.visible,
                ),
                SmallTextWidget(
                  address.fullAddress,
                  size: AppDimensions.font20(context),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Radio(
                value: address.key,
                groupValue: state.defaultAddress?.key,
                onChanged: (value) {
                  context
                      .read<ProfileBloc>()
                      .add(SetDefaultAddressEvent(address: address));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
