import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onekgp_app/ui/utils/size_config.dart';

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(_blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const int _blackPrimaryValue = 0xFF000000;

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  backgroundColor: Colors.black,
  elevation: 0,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    primarySwatch: primaryBlack,
  ),
  indicatorColor: Colors.black,
  textTheme: GoogleFonts.nunitoTextTheme().copyWith(
    // text theme of the header on each step
    headline6: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 24,
    ),
  ),
  // theme of the form fields for each step
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.grey[200],
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
  // theme of the primary button for each step
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      elevation: 0,
    ),
  ),
);
ThemeData darkTheme = ThemeData(brightness: Brightness.dark, textTheme: GoogleFonts.nunitoTextTheme());
