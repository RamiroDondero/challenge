import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

class CardReserva extends StatelessWidget {
  final String nombre;
  final String ubicaion;
  final bool carrito;
  final bool discapacitado;
  final int numeroPersonas;
  final String telefonoReserva;
  final String comentario;
  final String hora;
  final String email;

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
  });

  @override
  Widget build(BuildContext context) {
   
    const boxDecoration = BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2)
    ]);
    return Container(
        decoration: boxDecoration,
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 224,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _TituloCard(
              nombre: nombre,
              numeroPersonas: numeroPersonas,
              hora: hora,
            ),
    
            _Asignaciones(
              ubicacion: ubicaion,
              carrito: carrito,
              discapacitado: discapacitado,
            ),
           
            _Contenido(
              tel: telefonoReserva,
              email: email,
              comentario: comentario,
            ),
           
            _Opciones(),

            Container(width: 50, height: 2, color: CustomThemeData.greyLines ,)
            
          ],
        ));
  }
}

class _TituloCard extends StatelessWidget {
  const _TituloCard(
      {
      required this.nombre,
      required this.numeroPersonas,
      required this.hora})
      ;

  final String nombre;
  final int numeroPersonas;
  final String hora;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildIzq(), _buildDerecha()],
    );
  }

  Widget _buildIzq() {
    Icon icon(IconData icon, Color color) =>
        Icon(icon, size: 12.54, color: color);

    return Row(
      children: [
        Text(nombre,
            style: const TextStyle(
                color: CustomThemeData.dark, fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(width: 3),
        icon(CupertinoIcons.checkmark_seal, CustomThemeData.check),
        const SizedBox(width: 3),
        icon(CupertinoIcons.percent, Colors.red),
        const SizedBox(width: 3),
        icon(CupertinoIcons.chat_bubble_text, Colors.grey)
      ],
    );
  }

  Widget _buildDerecha() => Row(
        children: [
          const Icon(Icons.person_outline_outlined, size: 16),
          Text('$numeroPersonas', style: const TextStyle(fontSize: 12)),
          const SizedBox(width: 5),
          const CircleAvatar(maxRadius: 2, backgroundColor: Colors.black),
          const SizedBox(width: 5),
          const Icon(Icons.calendar_today_outlined, size: 12),
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
        _buildAsignacion(
            Icon(
              Icons.wheelchair_pickup,
              size: 12,
              color: discapacitado ? CustomThemeData.primaryColor : Colors.grey,
            ),
            disabled: !discapacitado),
        const SizedBox(width: 10),
        _buildAsignacion(
            Icon(
              Icons.baby_changing_station,
              size: 12,
              color: carrito ? CustomThemeData.primaryColor  : Colors.grey,
            ),
            disabled: !carrito),
        const SizedBox(width: 10),
        _buildAsignacion(
            Text(ubicacion, style: const TextStyle(fontSize: 12, color: CustomThemeData.primaryColor ))),
      ],
    );
  }

  Container _buildAsignacion(Widget child, {bool disabled = false}) {
    return Container(
        alignment: Alignment.center,
        height: 25,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            border: Border.all(color: disabled ? Colors.grey : CustomThemeData.primaryColor ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: child);
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
        _buildLine(Icons.phone, tel),
        const SizedBox(height: 5),
        _buildLine(Icons.email, email),
        const SizedBox(height: 5),
        _buildLine(Icons.comment_outlined, comentario),
      ],
    );
  }

  Row _buildLine(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 12, color: Colors.grey),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

class _Opciones extends StatelessWidget {
  
  final textStyle = const TextStyle(fontSize: 12, color: CustomThemeData.primaryColor);
  final shadow = const BoxShadow(color: Colors.black12, blurRadius: 3 , offset: Offset(1, 1) );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButton(CupertinoIcons.chat_bubble_text, 'Editar nota'),
        _buildButton(CupertinoIcons.pen, 'Editar reseva'),
        _buildButton(CupertinoIcons.tray_arrow_up_fill, 'Asignar mesa'),
      ],
    );
  }

  Widget _buildButton(IconData icon, String text) => Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
        decoration:  BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: Colors.white,
            boxShadow: [shadow]),
        child: Row(
          children: [
            Icon(icon, size: 12),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: textStyle,
            )
          ],
        ),
      );
}
