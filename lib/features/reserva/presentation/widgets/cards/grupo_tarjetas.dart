import 'package:flutter/material.dart';
import 'package:woki_partner/features/reserva/domain/entities/grupo_reservas.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

import '../../../../../core/custom_theme_data.dart';
import '../../../domain/entities/reserva.dart';

class GrupoTarjetas extends StatelessWidget {
  final GrupoReservas grupoReservas;

  const GrupoTarjetas({super.key, required this.grupoReservas});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(color: CustomThemeData.greyLines),
            _Horario(grupoReservas),
            const Divider(color: CustomThemeData.greyLines),
            _GrupoDeTarjetas(listaReservas: grupoReservas.reservas)
          ],
        ),
      ),
    );
  }
}

class _Horario extends StatelessWidget {
  final GrupoReservas grupoReservas;

  const _Horario(this.grupoReservas);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(grupoReservas.rangoHorario, style: CustomThemeData.horaGrupoReservas),
        Container(
          decoration: CustomThemeData.sombrasTarjetas,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          child: Row(
            children: const [
              CustomIcon(CustomThemeData.tableRestaurantIcon),
              SizedBox(width: 5),
              Text('11/50', style: CustomThemeData.subtitle),
              SizedBox(width: 5),
              CustomIcon(Icons.east)
            ],
          ),
        )
      ],
    );
  }
}

class _GrupoDeTarjetas extends StatelessWidget {
  final List<Reserva> listaReservas;

  const _GrupoDeTarjetas({required this.listaReservas});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: listaReservas
            .map((reserva) => CardReserva(
                state: reserva.state ,
                nombre: reserva.clientData[0].name,
                ubicaion: reserva.sector.toString(),
                carrito: true,
                discapacitado: false,
                numeroPersonas: reserva.quantity,
                telefonoReserva: reserva.clientData[0].phone,
                comentario: reserva.comment,
                hora: reserva.day,
                email: reserva.clientData[0].email))
            .toList());
  }
}
