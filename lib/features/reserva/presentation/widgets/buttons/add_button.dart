import 'package:flutter/material.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

import '../widgets.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return Container(
          decoration: CustomThemeData.formDraggable,
          child:  const FormListaEspera()
        );
          },);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
            color: CustomThemeData.addButton, shape: BoxShape.circle),
        child: const Icon(Icons.person_add_alt_1_sharp, color: Colors.white),
      ),
    );
  }
}
