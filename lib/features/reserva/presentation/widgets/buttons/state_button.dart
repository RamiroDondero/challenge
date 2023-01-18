import 'package:flutter/material.dart';
import 'package:woki_partner/core/constants/custom_theme_data.dart';


class StateButton extends StatelessWidget {
  final String text;
  final bool selected;
  final int cant;

  const StateButton({
    super.key,
    required this.text,
    required this.selected,
    this.cant = 0 ,
  });

  @override
  Widget build(BuildContext context) {

    final boxDecoration = BoxDecoration(
        boxShadow: [CustomThemeData.sombra],
        color: selected ? CustomThemeData.primaryColor : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)));

    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 30,
      decoration: boxDecoration,
      duration: const Duration(milliseconds: 200),
      child: Text('$text ($cant)',
          style: TextStyle(
              color: selected ? Colors.white : CustomThemeData.primaryColor,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6)),
    );
  }
}
