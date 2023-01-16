import 'package:woki_partner/core/custom_theme_data.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

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
                  _BotonesEstadoReserva(),
                  const SizedBox(height: 15),
                  state.currentPage == 1
                      ? _ListaEspera()
                      : _ListaReservas(state)
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
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ReservasBloc>(context);

    final List<Map<String, dynamic>> botones = [
      {'text': 'RESERVAS', 'cant': bloc.state.reservasVivas},
      {'text': 'ESPERA', 'cant': bloc.state.cantEnListaEspera},
      {'text': 'NO VINO', 'cant': bloc.state.noConcurrieron},
      {'text': 'INGRESADOS', 'cant': bloc.state.ingreasadas},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              4,
              (index) => GestureDetector(
                    onTap: (() {
                      bloc.add(ChangePageEvent(index));
                      bloc.add(ListUpdateEvent());
                    }),
                    child: StateButton(
                        text: botones[index]['text'],
                        cant: botones[index]['cant'],
                        selected:
                            bloc.state.currentPage == index ? true : false),
                  ))),
    );
  }
}

class _ListaReservas extends StatelessWidget {
  final ReservasState state;
  const _ListaReservas(this.state);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.listaReservasAgrupadas.length,
        itemBuilder: (BuildContext context, int index) {
          return state.listaReservasAgrupadas[index].reservas.isEmpty
              ? const SizedBox()
              : GrupoTarjetas(
                  grupoReservas: state.listaReservasAgrupadas[index]);
        },
      ),
    );
  }
}

class _ListaEspera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lista = BlocProvider.of<ReservasBloc>(context).state.listaEspera;
    final size = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const Text('Lista de Espera', style: CustomThemeData.horaGrupoReservas),
        const Divider(),
        SizedBox(
            height: size * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(lista.length, (index) => CardReserva(
                  nombre: lista[index]['nombre'],
                  sector: lista[index]['sector'],
                  personas: lista[index]['personas'],
                  telefono: lista[index]['telefono'],
                  horaOespera: Text('Demora ${lista[index]['demora']} min' , style: CustomThemeData.subtitle),
                  bubble: true,
                  ))
              ),
            ))
      ],
    );
  }
}
