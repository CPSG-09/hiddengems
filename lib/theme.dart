import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static MaterialColor primarySwatch = MaterialColor(0xFF442863, _swatch);

  // Color scheme
  static const Color bgRed = Color.fromARGB(255, 255, 0, 0);
  static const Color bgPink = Color.fromARGB(255, 254, 50, 121);
  static const Color bgGrey = Color.fromARGB(255, 233, 233, 233);
  static const Color bgWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color bgPurple = Color.fromARGB(255, 67, 40, 99);
  static const Color bgHalfWhite = Color.fromARGB(136, 255, 255, 255);
  static const Color bgHalfBlack = Color.fromARGB(128, 0, 0, 0);
  static const Color bgPurpleDark = Color.fromARGB(255, 58, 34, 84);
  static const Color bgPurpleLight = Color.fromARGB(255, 213, 173, 255);
  static const Color bgTransparent = Color.fromARGB(0, 255, 255, 255);
  static const Color bgQuarterWhite = Color.fromARGB(73, 255, 255, 255);
  static const Color bgPurpleLighter = Color.fromARGB(255, 226, 200, 255);

  static const Color fgPink = Color.fromARGB(255, 254, 50, 121);
  static const Color fgGrey = Color.fromARGB(255, 164, 164, 164);
  static const Color fgBlack = Color.fromARGB(255, 0, 0, 0);
  static const Color fgWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color fgPurple = Color.fromARGB(255, 67, 40, 99);
  static const Color fgYellow = Color.fromARGB(255, 250, 163, 1);
  static const Color fgGreyDark = Color.fromARGB(255, 102, 102, 102);
  static const Color fgBlueDark = Color.fromARGB(255, 11, 0, 42);
  static const Color fgHalfWhite = Color.fromARGB(136, 255, 255, 255);
  static const Color fgGreyPurple = Color.fromARGB(255, 72, 64, 95);
  static const Color fgGreyDarker = Color.fromARGB(255, 68, 68, 68);

  // Text styles
  static TextStyle poppins24BoldBlueDark = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: fgBlueDark,
  );

  static TextStyle poppins16BoldGreyPurple = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: fgGreyPurple,
  );

  static TextStyle poppins16SemiBoldWhite = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: fgWhite,
  );

  static TextStyle poppins14BoldBlueDark = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: fgBlueDark,
  );

  static TextStyle poppins14BoldPurple = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: fgPurple,
  );

  static TextStyle poppins14BoldWhite = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: fgWhite,
  );

  static TextStyle poppins14SemiBoldWhite = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: fgWhite,
  );

  static TextStyle poppins14SemiBoldPurple = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: fgPurple,
  );

  static TextStyle poppins14SemiBoldRed = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: bgRed,
  );

  static TextStyle poppins12BoldBlueDark = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: fgBlueDark,
  );

  static TextStyle poppins12SemiBoldPurple = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: fgPurple,
  );

  static TextStyle poppins12MediumHalfWhite = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: bgHalfWhite,
  );

  static TextStyle poppins12MediumWhite = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: fgWhite,
    decoration: TextDecoration.none,
  );

  static TextStyle poppins12RegularBlueDark = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: fgBlueDark,
    decoration: TextDecoration.none,
  );

  static TextStyle heebo14RegularBlack = GoogleFonts.heebo(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: fgBlack,
  );

  static TextStyle heebo10MediumBlueDark = GoogleFonts.heebo(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: fgBlueDark,
    height: 1,
  );

  static TextStyle poppins10SemiBoldGrey = GoogleFonts.poppins(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: fgGrey,
  );

  static TextStyle poppins8BoldPink = GoogleFonts.poppins(
    fontSize: 8,
    fontWeight: FontWeight.bold,
    color: fgPink,
  );

  static TextStyle heebo12MediumGreyDarker = GoogleFonts.heebo(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: fgGreyDarker,
    height: 1,
  );

  static TextStyle heebo12MediumBlueDark = GoogleFonts.heebo(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: fgBlueDark,
    height: 1,
  );

  static TextStyle heebo10MediumWhite = GoogleFonts.heebo(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: fgWhite,
    height: 1,
  );

  static TextStyle heebo10RegularBlack = GoogleFonts.heebo(
    fontSize: 10,
    fontWeight: FontWeight.normal,
    color: fgBlack,
    height: 1,
  );

  // Other widget-specific styles
  static SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle.light.copyWith(
    statusBarColor: AppTheme.bgPurpleDark,
  );
  static AppBarTheme appBarTheme = const AppBarTheme(
    backgroundColor: bgPurple,
  );

  static InputDecoration inputDecoration(String hintText) => InputDecoration(
        filled: true,
        fillColor: AppTheme.bgGrey,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(14),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppTheme.bgGrey, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppTheme.bgPurple, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppTheme.bgPurple, width: 2),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      );
}

Map<int, Color> _swatch = {
  900: const Color(0xFF442863),
  800: const Color(0xFF5D3178),
  700: const Color(0xFF6B3782),
  600: const Color(0xFF7B3E8C),
  500: const Color(0xFF874293),
  400: const Color(0xFF9858A2),
  300: const Color(0xFFA973B3),
  200: const Color(0xFFC299C9),
  100: const Color(0xFFDAC1DE),
  50: const Color(0xFFF0E6F1),
};
