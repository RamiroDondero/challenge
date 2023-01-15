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
        Container(
          color: Colors.red.withOpacity(0.4),
          width: double.infinity,
          height: 234
        ),
        const Positioned(
          top: 10,
          left: 0,
          right: 0,
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
      ],
    );
  }
}
