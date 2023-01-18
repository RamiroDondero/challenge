import 'package:flutter/material.dart';
import 'package:woki_partner/core/constants/custom_theme_data.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  const CustomIcon(this.icon, {super.key, this.color = CustomThemeData.dark, this.size = 12});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}
