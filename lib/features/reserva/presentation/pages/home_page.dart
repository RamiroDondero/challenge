import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/card_reserva.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final reservasBloc = BlocProvider.of<ReservasBloc>(context);

    return Scaffold(
      body: BlocBuilder<ReservasBloc, ReservasState>(
        builder: (context, state) {
          final lista = state.listaReservas;
          return state.listaReservas.isEmpty
              ? const Text('no hay data')
              : ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardReserva(
                        nombre: lista[index].clientData?[0]?.name ?? '',
                        ubicaion: lista[index].sector.toString(),
                        carrito: true,
                        discapacitado: false,
                        numeroPersonas: lista[index].quantity ?? 0,
                        telefonoReserva: lista[index].clientData?[0]?.phone ?? '',
                        comentario: lista[index].comment ?? '',
                        hora: lista[index].acceptedTimestamp ?? '',
                        email: lista[index].clientData?[0]?.name ?? '',
                        );
                  },
                );
        },
      ),
    );
  }
}
