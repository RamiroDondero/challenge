import 'package:flutter/material.dart';

import '../../../../../core/custom_theme_data.dart';

class Preferences extends StatelessWidget {
  final bool disabled;
  final Widget child;

  const Preferences({super.key, this.disabled = false , required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(
                color: disabled ? Colors.grey : CustomThemeData.primaryColor),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: child);
  }
}
