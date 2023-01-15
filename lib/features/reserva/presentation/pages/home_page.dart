import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/pages/lista_espera.dart';
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
                  ? const ListaEsperaScreen()
                  :_ListaReservas(state)

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
