// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kw_store/core/utils/media_query_values.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/constant.dart';
import '../bloc/home_bloc.dart';

class HomeSearchWidget extends StatefulWidget {
  const HomeSearchWidget({
    super.key,
  });

  @override
  State<HomeSearchWidget> createState() => _HomeSearchWidgetState();
}

class _HomeSearchWidgetState extends State<HomeSearchWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _stopSearching() {
    FocusScope.of(context).unfocus();
    final state = context.read<HomeBloc>().state;
    context.read<HomeBloc>().emit(
          state.copyWith(
            isSearch: false,
          ),
        );
    _searchController.clear();
  }

  void _search() {
    context.read<HomeBloc>().add(
          SearchEvent(
            _searchController.value.text,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(
        AppConstant.defaultPadding(context) / 2,
      ),
      child: TextFormField(
        controller: _searchController,
        scrollPadding: EdgeInsets.zero,
        textInputAction: TextInputAction.search,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black,
            ),
        keyboardType: TextInputType.text,
        onFieldSubmitted: (value) {
          if (value.isEmpty) {
            _stopSearching();
          } else {
            _search();
          }
        },
        onChanged: (value) {
          if (value.isEmpty) {
            _stopSearching();
          } else {
            _search();
          }
        },
        decoration: InputDecoration(
          hintText: AppStrings.search(context),
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.grey.shade500,
              ),
          prefixIcon: Icon(
            Icons.search,
            color: context.theme.iconTheme.copyWith(color: Colors.black).color,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              _stopSearching();
            },
            icon: const Icon(
              Icons.clear,
              color: Colors.red,
            ),
          ),
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
