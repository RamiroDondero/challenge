import 'package:flutter/material.dart';

import '../../../../../core/constants/custom_theme_data.dart';
import '../widgets.dart';

class Preferences extends StatelessWidget {
  final bool discapacitado;
  final bool carrito;
  final String ubicacion;

  const Preferences(
      {super.key, required this.discapacitado,
      required this.carrito,
      required this.ubicacion});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _Preferences(
            disabled: !discapacitado,
            child: CustomIcon(Icons.wheelchair_pickup,
                color: discapacitado
                    ? CustomThemeData.primaryColor
                    : Colors.grey)),
        const SizedBox(width: 10),
        _Preferences(
            disabled: !carrito,
            child: CustomIcon(Icons.baby_changing_station,
                color: carrito ? CustomThemeData.primaryColor : Colors.grey)),
        const SizedBox(width: 10),
        _Preferences(
            child: Row(
          children: [
            const CustomIcon(CustomThemeData.tableRestaurantIcon,
                color: CustomThemeData.primaryColor),
            const SizedBox(width: 5),
            Text(ubicacion,
                style: const TextStyle(
                    fontSize: 12, color: CustomThemeData.primaryColor)),
          ],
        )),
      ],
    );
  }
}


class _Preferences extends StatelessWidget {
  final bool disabled;
  final Widget child;

  const _Preferences({ this.disabled = true, required this.child});



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