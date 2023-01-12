import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

import '../../../../core/custom_theme_data.dart';
import '../../domain/entities/reserva.dart';

class GrupoTarjetas extends StatelessWidget {
  final List<Reserva> reservas;

  const GrupoTarjetas({super.key, this.reservas = const []});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [

          const Divider(color: CustomThemeData.greyLines),

          const _Horario(),

          const Divider(color: CustomThemeData.greyLines),

          _GrupoDeTarjetas(listaReservas: reservas)
        ],
      ),
    );
  }
}

class _Horario extends StatelessWidget {
  const _Horario();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('11:00hs - 14:00hs',
              style: CustomThemeData.horaGrupoReservas),
          Row(
            children: [
              CustomThemeData.icon(Icons.add),
              const SizedBox(width: 5),
              const Text('11/50', style: CustomThemeData.iconosReservas),
              const SizedBox(width: 5),
              CustomThemeData.icon(CupertinoIcons.arrow_right)
            ],
          )
        ],
      ),
    );
  }
}

class _GrupoDeTarjetas extends StatelessWidget {
  final List<Reserva> listaReservas;

  const _GrupoDeTarjetas({required this.listaReservas});

  @override
  Widget build(BuildContext context) {
    return Column(children: 
      listaReservas.map((reserva) => CardReserva(
        nombre: reserva.clientData?[0]?.name ?? '',
        ubicaion: reserva.sector.toString(),
        carrito: true,
        discapacitado: false,
        numeroPersonas: reserva.quantity ?? 0,
        telefonoReserva: reserva.clientData?[0]?.phone ?? '' ,
        comentario: reserva.comment ?? '',
        hora: reserva.day ?? '',
        email: reserva.clientData?[0]?.email ?? ''
        )).toList()
     );
  }
}
