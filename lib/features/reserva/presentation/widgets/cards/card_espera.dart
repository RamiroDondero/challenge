import 'package:flutter/material.dart';
import 'package:woki_partner/core/custom_theme_data.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

class CardEspera extends StatelessWidget {
  final int orden;

  const CardEspera({super.key, required this.orden});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
          top: 10,
          child: CardReserva(
              nombre: 'nombre',
              ubicaion: 'ubicacion',
              carrito: true,
              discapacitado: true,
              numeroPersonas: 10,
              telefonoReserva: 'telefonoReserva',
              comentario: 'comentario',
              email: 'email',
              checkAndDiscount: true,
              horaOespera: Text('horario')),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: CircleAvatar(
            radius: 14,
            backgroundColor: CustomThemeData.primaryColor,
            child: Text('$orden'),
          ),
        ),
        const SizedBox(
          width: 400,
          height: 240,
        )
      ],
    );
  }
}
