import 'package:flutter/material.dart';

import '../../../../../core/constants/custom_theme_data.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;

  const CircleButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 34,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: CustomThemeData.greyLines)),
      child: Icon(icon),
    );
  }
}
