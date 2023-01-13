import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

import 'package:woki_partner/features/reserva/presentation/widgets/widgets.dart';

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
   
    return Container(
        
        decoration: CustomThemeData.sombrasTarjetas,
        padding: const EdgeInsets.only(top: 16 , right: 16, left: 16 , bottom: 5),
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

            Container(width: 67, height: 2, color: CustomThemeData.greyLines)
            
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
      children: [_margenIzq(), _margenDerecho()],
    );
  }

  Widget _margenIzq() {
    

    return Row(
      children: [

        Text(nombre, style: CustomThemeData.nombreUsuario),

        const SizedBox(width: 3),

        const CustomIcon( CupertinoIcons.checkmark_seal , color: CustomThemeData.check,),
        
        const SizedBox(width: 3),

        const CustomIcon( CupertinoIcons.percent, color: Colors.red),

        const SizedBox(width: 3),

        const CustomIcon(CupertinoIcons.chat_bubble_text, color: Colors.grey)
      ],
    );
  }

  Widget _margenDerecho() => Row(
        children: [

          const CustomIcon(Icons.person_outline_outlined , size: 16),

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
              child: CustomIcon(
              Icons.wheelchair_pickup,
              color: discapacitado ? CustomThemeData.primaryColor : Colors.grey)),

        const SizedBox(width: 10),

        Preferences( 
              disabled: !carrito,
              child: CustomIcon(
              Icons.baby_changing_station,
              color: carrito ? CustomThemeData.primaryColor : Colors.grey )
           ),

        const SizedBox(width: 10),

        Preferences(
           child:
            Row(

              children: [
                const CustomIcon( CustomThemeData.tableRestaurantIcon,color: CustomThemeData.primaryColor),

                const SizedBox(width: 5),

                Text(ubicacion, style: const TextStyle(fontSize: 12, color: CustomThemeData.primaryColor )),

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

        _buildLine(Icons.phone, tel),

        const SizedBox(height: 5),

        _buildLine(Icons.email, email),

        const SizedBox(height: 5),

        _buildLine(CupertinoIcons.chat_bubble_text, comentario),

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
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildButton(CupertinoIcons.chat_bubble_text, 'Editar nota'),
        _buildButton(Icons.edit_outlined, 'Editar reseva'),
        _buildButton(CustomThemeData.tableRestaurantIcon, 'Asignar mesa'),
      ],
    );
  }

  Widget _buildButton(IconData icon, String text) => Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 6),
        decoration: CustomThemeData.sombrasTarjetas,
        child: Row(
          children: [
            Icon(icon, size: 12),
            const SizedBox(width: 5),
            Text( text, style: CustomThemeData.subtitle )
          ],
        ),
      );
}