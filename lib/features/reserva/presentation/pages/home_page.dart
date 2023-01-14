import 'package:woki_partner/features/reserva/domain/entities/reserva.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

import '../../../user/domain/entity/client_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReservasBloc, ReservasState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const _AddButton(),
                  const SizedBox(height: 15),
                  const _BotonesEstadoReserva(),
                  const SizedBox(height: 15),
                  _ListaReservas(state)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return const Align(alignment: Alignment.centerRight, child: AddButton());
  }
}

class _BotonesEstadoReserva extends StatelessWidget {
  const _BotonesEstadoReserva();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            StateButton(text: 'RESERVAS', selected: true),
            StateButton(text: 'ESPERA', selected: false),
            StateButton(text: 'NO VINO', selected: false),
            StateButton(text: 'INGRESADOS', selected: false),
          ]),
    );
  }
}

class _ListaReservas extends StatelessWidget {
  final ReservasState state;

  const _ListaReservas(this.state);

  @override
  Widget build(BuildContext context) {
    final listaAgrupada = state.listaReservasAgrupadas;

    return Expanded(
      child: ListView.builder(
        itemCount: listaAgrupada.length,
        itemBuilder: (BuildContext context, int index) {
                 
          return listaAgrupada[index].reservas.isEmpty
           ? const SizedBox()
           :GrupoTarjetas(grupoReservas: listaAgrupada[index]);
        },
      ),
    );
  }
}

