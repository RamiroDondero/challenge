import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

class CardReserva extends StatefulWidget {
  final String nombre;
  final String ubicaion;
  final bool carrito;
  final bool discapacitado;
  final int numeroPersonas;
  final String telefonoReserva;
  final String comentario;
  final String hora;
  final String email;
  final int state;

  const CardReserva({
    super.key,
    required this.nombre,
    required this.ubicaion,
    required this.carrito,
    required this.discapacitado,
    required this.numeroPersonas,
    required this.telefonoReserva,
    required this.comentario,
    required this.hora,
    required this.email,
    required this.state,
  });

  @override
  State<CardReserva> createState() => _CardReservaState();
}

class _CardReservaState extends State<CardReserva> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        show = !show;
        setState(() { });
      },
      child: AnimatedContainer(
          height: show == true ? 224 : 100,
          margin: const EdgeInsets.only(bottom: 3, top: 4),
          decoration: CustomThemeData.sombrasTarjetas,
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 5),
          duration: const Duration(milliseconds: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _TituloCard(
                nombre: widget.nombre,
                numeroPersonas: widget.numeroPersonas,
                hora: widget.hora,
                comentario: widget.comentario,
                state: widget.state,
              ),

              const SizedBox(height: 10),

              _Asignaciones(
                ubicacion: widget.ubicaion,
                carrito: widget.carrito,
                discapacitado: widget.discapacitado,
              ),

              const SizedBox(height: 10),

              show == true
              ?_Contenido(
                tel: widget.telefonoReserva,
                email: widget.email,
                comentario: widget.comentario,
              )
              :const SizedBox(),

              show == true
              ?const SizedBox(height: 10)
              :const SizedBox(),

              show == true
              ?_Opciones()
              :const SizedBox(),

              show == true
              ?const SizedBox(height: 10)
              :const SizedBox(),

              Container(width: 67, height: 2, color: CustomThemeData.greyLines)
            ],
          )),
    );
  }
}

class _TituloCard extends StatelessWidget {
  const _TituloCard(
      {required this.nombre,
      required this.numeroPersonas,
      required this.hora,
      required this.comentario,
      required this.state});

  final String nombre;
  final int numeroPersonas;
  final String hora;
  final String comentario;
  final int state;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_margenIzq(state, comentario), _margenDerecho()],
    );
  }

  Widget _margenIzq(int state, String comentario) {
    return Row(
      children: [
        Text(nombre, style: CustomThemeData.nombreUsuario),
        const SizedBox(width: 3),
        state == 5
            ? const CustomIcon(CupertinoIcons.checkmark_seal,
                color: CustomThemeData.check)
            : const SizedBox(),
        const SizedBox(width: 3),
        state == 5
            ? const CustomIcon(CupertinoIcons.percent, color: Colors.red)
            : const SizedBox(),
        const SizedBox(width: 3),
        comentario.isEmpty
            ? const SizedBox()
            : const CustomIcon(CupertinoIcons.chat_bubble_text,
                color: Colors.grey)
      ],
    );
  }

  Widget _margenDerecho() => Row(
        children: [
          const CustomIcon(Icons.person_outline_outlined, size: 16),
          Text('$numeroPersonas', style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          const CircleAvatar(maxRadius: 2, backgroundColor: Colors.black),
          const SizedBox(width: 5),
          const CustomIcon(Icons.calendar_today_outlined),
          const SizedBox(width: 5),
          const Text('12:00 hs', style: TextStyle(fontSize: 12)),
        ],
      );
}

class _Asignaciones extends StatelessWidget {
  final bool discapacitado;
  final bool carrito;
  final String ubicacion;

  const _Asignaciones(
      {required this.discapacitado,
      required this.carrito,
      required this.ubicacion});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Preferences(
            disabled: !discapacitado,
            child: CustomIcon(Icons.wheelchair_pickup,
                color: discapacitado
                    ? CustomThemeData.primaryColor
                    : Colors.grey)),
        const SizedBox(width: 10),
        Preferences(
            disabled: !carrito,
            child: CustomIcon(Icons.baby_changing_station,
                color: carrito ? CustomThemeData.primaryColor : Colors.grey)),
        const SizedBox(width: 10),
        Preferences(
            child: Row(
          children: [
            const CustomIcon(CustomThemeData.tableRestaurantIcon,
                color: CustomThemeData.primaryColor),
            const SizedBox(width: 5),
            Text(ubicacion,
                style: const TextStyle(
                    fontSize: 12, color: CustomThemeData.primaryColor)),
          ],
        )),
      ],
    );
  }
}

class _Contenido extends StatelessWidget {
  final String tel;
  final String email;
  final String comentario;

  const _Contenido(
      {required this.tel, required this.email, required this.comentario});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tel.isEmpty ? const SizedBox() : LineText(Icons.phone, tel),
        const SizedBox(height: 5),
        email.isEmpty ? const SizedBox() : LineText(Icons.email, email),
        const SizedBox(height: 5),
        comentario.isEmpty
            ? const SizedBox()
            : LineText(CupertinoIcons.chat_bubble_text, comentario),
      ],
    );
  }
}

class _Opciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        OptionButton(CupertinoIcons.chat_bubble_text, 'Editar nota'),
        OptionButton(Icons.edit_outlined, 'Editar reseva'),
        OptionButton(CustomThemeData.tableRestaurantIcon, 'Asignar mesa'),
      ],
    );
  }
}
