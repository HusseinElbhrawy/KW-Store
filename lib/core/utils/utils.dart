import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_toast/motion_toast.dart';

import '../widgets/big_text_widget.dart';
import '../widgets/small_text_widget.dart';
import 'app_strings.dart';
import 'constant.dart';
import 'dimensions.dart';
import 'fonts_manager.dart';
import 'media_query_values.dart';

class AppUtils {
  AppUtils._internal();
  static final AppUtils _instance = AppUtils._internal();
  factory AppUtils() => _instance;

  static String makeFirstLetterCapital(String text) {
    return text
        .split(" ")
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(" ")
        .toString();
  }

  static double customAspectRatio(BuildContext context) {
    return context.aspectRatio > .75
        ? context.aspectRatio * 1.25
        : context.aspectRatio * 1.50;
  }

  Route _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Future<dynamic> showLogoutBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(
            AppConstant.defaultPadding(context),
          ),
          topRight: Radius.circular(
            AppConstant.defaultPadding(context),
          ),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(AppConstant.defaultPadding(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: AppDimensions.height10(context),
                ),
                height: context.responsiveHeight(2.5),
                width: context.responsiveWidth(50),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppConstant.defaultPadding(context),
                  ),
                  color: Colors.grey,
                ),
              ),
              AppConstant.horizontalDivider(),
              BigTextWidget(
                AppStrings.logout(context),
                fontWeight: AppFontsWeight.medium,
              ),
              AppConstant.horizontalDivider(),
              Divider(
                thickness: .05,
                endIndent: AppDimensions.width20(context),
                indent: AppDimensions.width20(context),
              ),
              AppConstant.horizontalDivider(),
              BigTextWidget(
                AppStrings.areYouSureYouWantLogOut(context),
                align: TextAlign.center,
                size: AppDimensions.font20(context),
                fontWeight: AppFontsWeight.medium,
              ),
              AppConstant.horizontalDivider(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                      ),
                      child: SmallTextWidget(
                        AppStrings.cancel(context),
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(width: AppConstant.defaultPadding(context)),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade300,
                      ),
                      child: SmallTextWidget(
                        AppStrings.yesLogout(context),
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }
    final newText = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (newText.length > 16) {
      newText = newText.substring(0, 16);
    }
    if (newText.length > 4 && newText.length <= 8) {
      newText = '${newText.substring(0, 4)} ${newText.substring(4)}';
    } else if (newText.length > 8 && newText.length <= 12) {
      newText =
          '${newText.substring(0, 4)} ${newText.substring(4, 8)} ${newText.substring(8)}';
    } else if (newText.length >= 12) {
      newText =
          '${newText.substring(0, 4)} ${newText.substring(4, 8)} ${newText.substring(8, 12)} ${newText.substring(12)}';
    }
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class CardHolderNameFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.toUpperCase();
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class CardCvvFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (newText.length > 3) {
      newText = newText.substring(0, 3);
    }
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

class ExpirationDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');
    if (newText.length > 4) {
      newText = newText.substring(0, 4);
    } else if (newText.length > 2) {
      newText = '${newText.substring(0, 2)}/${newText.substring(2)}';
    }
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}

MotionToast showWarningToast(final String desc) {
  return MotionToast.warning(
    description: SmallTextWidget(
      desc,
      fontFamily: AppFonts.jannah,
    ),
  );
}
