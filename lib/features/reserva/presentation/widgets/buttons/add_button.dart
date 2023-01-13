import 'package:flutter/material.dart';
import 'package:woki_partner/core/custom_theme_data.dart';


class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: const BoxDecoration(
        color: CustomThemeData.addButton,
        shape: BoxShape.circle
      ),
      child: const  Icon(Icons.person_add_alt_1_sharp, color: Colors.white),
    );
  }
}