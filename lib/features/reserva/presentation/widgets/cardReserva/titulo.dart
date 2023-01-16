import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/custom_theme_data.dart';
import '../widgets.dart';

class Titulo extends StatelessWidget {
  const Titulo(
      {super.key, required this.nombre,
      required this.numeroPersonas,
      required this.horaOespera,
      required this.comentario,
      required this.checkAndDiscount});

  final String nombre;
  final int numeroPersonas;
  final String comentario;
  final bool checkAndDiscount;
  final Widget horaOespera;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_margenIzq(), _margenDerecho()],
    );
  }

  Widget _margenIzq() {
    return Row(
      children: [
        Text(nombre, style: CustomThemeData.nombreUsuario),
        const SizedBox(width: 3),
        checkAndDiscount == true
            ? const CustomIcon(CupertinoIcons.checkmark_seal,
                color: CustomThemeData.check)
            : const SizedBox(),
        const SizedBox(width: 3),
        checkAndDiscount == true
            ? const CustomIcon(CupertinoIcons.percent, color: Colors.red)
            : const SizedBox(),
        const SizedBox(width: 3),
        comentario.isEmpty
            ? const SizedBox()
            : const CustomIcon(CupertinoIcons.chat_bubble_text,
                color: Colors.grey)
      ],
    );
  }

  Widget _margenDerecho() => Row(
        children: [
          const CustomIcon(Icons.person_outline_outlined, size: 16),
          Text('$numeroPersonas', style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          const CircleAvatar(maxRadius: 2, backgroundColor: Colors.black),
          const SizedBox(width: 5),
          const CustomIcon(Icons.calendar_today_outlined),
          const SizedBox(width: 5),
          horaOespera,
        ],
      );
}