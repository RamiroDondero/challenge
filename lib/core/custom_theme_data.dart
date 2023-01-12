import 'package:flutter/material.dart';

class CustomThemeData {
  static const Color primaryColor = Color(0xff0B4762);
  static const Color dark = Color(0xff041C32);
  static const Color grey = Color(0xff818181);
  static const Color greyLines = Color(0xffE7E7E7);
  static const Color check = Color(0xff1AAFDE);
  static const Color addButton = Color(0xff35C18F);
  static const Color divider = Color(0xffB9B9B9);

  static const TextStyle horaGrupoReservas = TextStyle( fontWeight: FontWeight.w600, color: CustomThemeData.dark, fontSize: 16);
  static const TextStyle iconosReservas = TextStyle(color: CustomThemeData.dark, fontSize: 12);

  static Widget icon(IconData icon) =>  Icon( icon , color: CustomThemeData.dark, size: 12);
}
