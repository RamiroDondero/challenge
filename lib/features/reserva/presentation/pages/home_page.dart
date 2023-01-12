import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

import '../../domain/entities/reserva.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reservasBloc = BlocProvider.of<ReservasBloc>(context);

    return Scaffold(
      body: BlocBuilder<ReservasBloc, ReservasState>(
        builder: (context, state) {
          final lista = state.listaReservas;
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Align( alignment: Alignment.centerRight, child: AddButton()),
                  const SizedBox(height: 15),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  const [
                      StateButton(text: 'RESERVAS', selected: true),
                      StateButton(text: 'ESPERA', selected: false),
                      StateButton(text: 'NO VINO', selected: false),
                      StateButton(text: 'INGRESADOS', selected: false),
                    ]),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: ListView.builder(
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        return card(lista, index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget card(List<Reserva> lista, int index) {
    final reserva = lista[index];
    final cliente = reserva.clientData?[0];
    return CardReserva(
      nombre: cliente?.name ?? '',
      ubicaion: reserva.sector.toString(),
      carrito: true,
      discapacitado: false,
      numeroPersonas: reserva.quantity ?? 0,
      telefonoReserva: cliente?.phone ?? '',
      comentario: reserva.comment ?? '',
      hora: reserva.acceptedTimestamp ?? '',
      email: cliente?.name ?? '',
    );
  }
}
