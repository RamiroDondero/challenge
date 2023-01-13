import 'package:flutter/material.dart';

import '../../../../../core/custom_theme_data.dart';

class OptionButton extends StatelessWidget {
  final IconData icon;
  final String text;


  const OptionButton(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
      decoration: CustomThemeData.sombrasTarjetas,
      child: Row(
        children: [
          Icon(icon, size: 12),
          const SizedBox(width: 5),
          Text(text, style: CustomThemeData.subtitle)
        ],
      ),
    );
  }
}
