import 'package:flutter/material.dart';

import '../../core/utils/app_colors.dart';

/**
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    actionsIconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color(0xff171D2D),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: const Color(0xff1E2336),
 */

ThemeData get kDarkTheme => ThemeData(
      //! Main Color

      colorScheme: ColorScheme.dark(
        primary: const Color(0xff171D2D),
        secondary: const Color(0xff2A2F4F),
        background: AppColors.background,
        error: AppColors.error,
        onPrimary: const Color(0xffE5BEEC),
      ),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff171D2D),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      //!Appbar THeme
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff171D2D),
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      //! Card Color
      cardColor: const Color(0xff2A2F4F),
      //! Radio Button Theme
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(Colors.white),
      ),

      //! Dialog Theme
      dialogTheme: const DialogTheme(backgroundColor: Color(0xff171D2D)),

      //!ElevatedButton Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const StadiumBorder(),
        ),
      ),
      //! TextButton Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.darkGrey,
          // padding: const EdgeInsets.all(0),
          alignment: AlignmentDirectional.center,
        ),
      ),

      //!OutlinedButton Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          //Todo : edit color here
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          backgroundColor: Colors.white24,
        ),
      ),
      //! Text Theme
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          color: Colors.white,
        ),
        headlineMedium: TextStyle(
          color: Colors.white,
        ),
        headlineSmall: TextStyle(
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
        ),
        displayMedium: TextStyle(
          color: Colors.white,
        ),
        displaySmall: TextStyle(
          color: Colors.white,
        ),
        displayLarge: TextStyle(
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
        bodySmall: TextStyle(
          color: Colors.black,
        ),
      ),

      //! InputDecoration Theme
      inputDecorationTheme: InputDecorationTheme(
        suffixIconColor: AppColors.white,
        contentPadding: const EdgeInsets.all(16),
        hintStyle: const TextStyle(
          color: AppColors.white,
          // fontFamily: AppFonts.,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
        iconColor: Colors.white,
        prefixIconColor: Colors.white,
        errorStyle: const TextStyle(color: AppColors.error),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      //!Bottom Nav Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.red,
      ),
      //! Chip Theme
      chipTheme: const ChipThemeData(),

      //!Floating Action Button
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xff2A2F4F),
        foregroundColor: Colors.white,
      ),
      //! Bottom Sheet Theme
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xff2A2F4F),
      ),
      //! Badge Theme
      badgeTheme: const BadgeThemeData(
        textColor: Colors.white,
        backgroundColor: Colors.red,
      ),
    );
