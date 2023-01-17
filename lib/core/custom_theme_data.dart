import 'package:flutter/material.dart';

class CustomThemeData {
  static final ThemeData customTheme = ThemeData(
      fontFamily: 'Poppins',
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primaryColor),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyLines),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: greyLines),
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ));

  // COLOR
  static const Color primaryColor = Color(0xff0B4762);
  static const Color dark = Color(0xff041C32);
  static const Color grey = Color(0xff818181);
  static const Color greyLines = Color(0xffE7E7E7);
  static const Color check = Color(0xff1AAFDE);
  static const Color addButton = Color(0xff35C18F);
  static const Color divider = Color(0xffB9B9B9);

  //ICON DATA
  static const IconData tableRestaurantIcon = Icons.table_restaurant_outlined;

  //TEXT STYLE
  static const TextStyle horaGrupoReservas = TextStyle(
      fontWeight: FontWeight.w600,
      color: CustomThemeData.dark,
      fontSize: 16,
      fontFamily: 'Poppins');

  static const TextStyle subtitle = TextStyle(
      color: CustomThemeData.dark, fontSize: 12, fontWeight: FontWeight.w500);


  static const TextStyle demora = TextStyle(
      color: Colors.red, fontSize: 12, fontWeight: FontWeight.w500);

  static const TextStyle nombreUsuario = TextStyle(
      color: CustomThemeData.dark, fontWeight: FontWeight.w700, fontSize: 14);

  static const TextStyle buttonSubmitTextStyle =
      TextStyle(fontWeight: FontWeight.w500, fontSize: 14);

  static TextStyle formTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: CustomThemeData.dark);

  //BOX SHADOW
  static BoxShadow sombra = BoxShadow(
      color: Colors.black12.withOpacity(0.05),
      blurRadius: 7,
      offset: const Offset(4, 4));

  //BOX DECORATION
  static BoxDecoration sombrasTarjetas = BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [sombra]);

  static BoxDecoration inputStyle = BoxDecoration(
      border: Border.all(color: CustomThemeData.greyLines),
      borderRadius: BorderRadius.circular(10));

  static BoxDecoration formDraggable = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30), topRight: Radius.circular(30)));

  // BUTTON STYLE
  static ButtonStyle buttonSubmitStyle = ButtonStyle(
      minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
      backgroundColor: MaterialStateProperty.all(CustomThemeData.primaryColor));

  static ButtonStyle optionButtonselected = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(CustomThemeData.primaryColor));

  static ButtonStyle optionButtonNoselected = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white));
}
