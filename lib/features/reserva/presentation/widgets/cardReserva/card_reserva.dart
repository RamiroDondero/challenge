import 'package:flutter/material.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

class CardReserva extends StatefulWidget {
  final String nombre;
  final String sector;
  final bool carrito;
  final bool discapacitado;
  final int personas;
  final String telefono;
  final String comentario;
  final String email;
  final bool checkAndDiscount;
  final Widget horaOespera;
  final Widget iconHoraOcalendario;
  final bool bubble;
  final int bubbleNum;

  const CardReserva({
    super.key,
    required this.nombre,
    required this.sector,
    required this.personas,
    required this.telefono,
    required this.horaOespera,
    this.comentario = '',
    this.email = '',
    this.bubbleNum = 0,
    this.bubble = false,
    this.carrito = false,
    this.discapacitado = false,
    this.checkAndDiscount = false, required this.iconHoraOcalendario,
  });

  @override
  State<CardReserva> createState() => _CardReservaState();
}

class _CardReservaState extends State<CardReserva> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _background(),
        Positioned(top: 7, right: 0, left: 0, child: _card()),
        widget.bubble == true
            ? CircleAvatar(
                backgroundColor: CustomThemeData.primaryColor,
                radius: 12,
                child: Text('${widget.bubbleNum}',
                    style:
                        CustomThemeData.subtitle.copyWith(color: Colors.white)))
            : const SizedBox()
      ],
    );
  }

  Widget _background() {
    return GestureDetector(
      onTap: () {
        show = !show;
        setState(() {});
      },
      child: AnimatedContainer(
        height: show == true ? 240 : 116,
        duration: const Duration(milliseconds: 90),
      ),
    );
  }

  Widget _card() {
    return GestureDetector(
      onTap: () {
        show = !show;
        setState(() {});
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
              Titulo(
                iconHoraOcalendario: widget.iconHoraOcalendario,
                horaOespera: widget.horaOespera,
                nombre: widget.nombre,
                numeroPersonas: widget.personas,
                comentario: widget.comentario,
                checkAndDiscount: widget.checkAndDiscount,
              ),
              const SizedBox(height: 10),
              Preferences(
                ubicacion: widget.sector,
                carrito: widget.carrito,
                discapacitado: widget.discapacitado,
              ),
              const SizedBox(height: 10),
              show == true
                  ? Contenido(
                      tel: widget.telefono,
                      email: widget.email,
                      comentario: widget.comentario,
                    )
                  : const SizedBox(),
              const SizedBox(height: 10),
              show == true ? const Opciones() : const SizedBox(),
              show == true ? const SizedBox(height: 10) : const SizedBox(),
              Container(width: 67, height: 2, color: CustomThemeData.greyLines)
            ],
          )),
    );
  }
}
