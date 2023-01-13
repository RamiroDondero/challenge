import 'package:flutter/material.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

class StateButton extends StatelessWidget {
  final String text;
  final bool selected;

  const StateButton({super.key, required this.text, required this.selected});

  @override 
  Widget build(BuildContext context) {

    final boxDecoration = BoxDecoration(
          boxShadow:  [ CustomThemeData.sombra ],
          color: selected ? CustomThemeData.primaryColor : Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)));

    return AnimatedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      // width: 110,
      height: 30,
      decoration:  boxDecoration,
      duration: const Duration(milliseconds: 500),
      child: Text('$text (0)', 
                  style:  TextStyle(
                    color: selected ? Colors.white : CustomThemeData.primaryColor ,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing:  0.6 
                    )),
    );
  }
}