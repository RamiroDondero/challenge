import 'package:flutter/material.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

class ListaEsperaScreen extends StatelessWidget {
  const ListaEsperaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const  [
        Divider(),
        Text('Lista de espera' , style: CustomThemeData.horaGrupoReservas,),
        Divider(),
        Text('ListaEsperaScreen'),
        Text('ListaEsperaScreen'),
        Text('ListaEsperaScreen'),
        Text('ListaEsperaScreen'),
        Text('ListaEsperaScreen'),
        Text('ListaEsperaScreen'),
      ],
    );
  }
}
