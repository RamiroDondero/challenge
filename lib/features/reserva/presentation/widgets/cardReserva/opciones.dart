import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/custom_theme_data.dart';
import '../widgets.dart';

class Opciones extends StatelessWidget {
  const Opciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        OptionButton(CupertinoIcons.chat_bubble_text, 'Editar nota'),
        OptionButton(Icons.edit_outlined, 'Editar reseva'),
        OptionButton(CustomThemeData.tableRestaurantIcon, 'Asignar mesa'),
      ],
    );
  }
}