import 'package:flutter/material.dart';

import 'app_colors.dart';

ThemeData appTheme() {
  return ThemeData(
      useMaterial3: true,
      //fontFamily: GoogleFonts.poppins().toString(),
      appBarTheme: const AppBarTheme(
        color: AppColors.primary,
        elevation: 1,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      dialogTheme: const DialogTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 2,
          backgroundColor: Colors.white),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
      ),
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primary,
      primaryColorLight: AppColors.primary,
      primaryIconTheme: const IconThemeData(color: AppColors.primary),
      colorScheme:
          ThemeData().colorScheme.copyWith(secondary: AppColors.headingColor),
      hintColor: const Color(0xffcdd3e0),
      dividerColor: Colors.grey[100],
      scaffoldBackgroundColor: Colors.grey.shade50,
      //textTheme: GoogleFonts.poppinsTextTheme(),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
        selectionColor: AppColors.primary,
        selectionHandleColor: AppColors.primary,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedIconTheme: IconThemeData(color: AppColors.primary),
          selectedItemColor: AppColors.primary,
          elevation: 20),
      inputDecorationTheme: InputDecorationTheme(
          border: const OutlineInputBorder(),
          errorStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w300,
            color: Colors.red,
          ),
          disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.borderColor,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.borderColor,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: AppColors.primary.withOpacity(0.5),
          )),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.red.withOpacity(0.5),
          )),
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          iconColor: AppColors.primary),
      dividerTheme: const DividerThemeData(
        color: Color(0xffEBECED),
        thickness: 1,
        space: 1,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return AppColors.primary;
              } else if (states.contains(MaterialState.disabled)) {
                return AppColors.primary;
              }
              return AppColors.secondary;
            },
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              //side: BorderSide(color: borderColor ?? Colors.transparent),
            ),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: MaterialStateProperty.all<Color>(AppColors.white),
        fillColor: MaterialStateProperty.all<Color>(AppColors.primary),
        //splashRadius: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        visualDensity: VisualDensity.compact,
        side: const BorderSide(
          color: AppColors.textBodyColor,
          width: 2,
          style: BorderStyle.solid,
          // strokeAlign: StrokeAlign.center)),
        ),
      ));
}
