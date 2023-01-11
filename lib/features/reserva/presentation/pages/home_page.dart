import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:woki_partner/features/reserva/infrastructure/models/reserva_model.dart';
import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
               final resp = File('test/fixtures/datos_prueba_tecnica.json').readAsStringSync();
        final decoded = json.decode(resp);
        final instancia = ReservaModel.fromMap(decoded[0]);
        print(instancia.sector);
      }),
      body: const Center(
          child: CardReserva(
              nombre: 'ramiro',
              ubicaion: 'mar del plata',
              carrito: true,
              discapacitado: true,
              numeroPersonas: 2,
              telefonoReserva: '4343',
              comentario: 'lalal',
              hora: 'lalal',
              email: 'ramiro')),
    );
  }
}
