import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/core/custom_theme_data.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/cards/card_espera.dart';

class ListaEsperaScreen extends StatelessWidget {
  const ListaEsperaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final listaEspera = BlocProvider.of<ReservasBloc>(context).state.listaEspera;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        const Divider(),
        const Text('Lista de espera' , style: CustomThemeData.horaGrupoReservas,),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:const [
                  CardEspera(orden: 1)
                ]
        )
      ],
    );
  }
}
