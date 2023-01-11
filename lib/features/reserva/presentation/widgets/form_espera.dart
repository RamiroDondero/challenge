import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woki_partner/core/custom_theme_data.dart';

class FormEspera extends StatelessWidget {
  const FormEspera({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _divider(),
          _title(),
          _date(),
          _inputStyle(_Nombre()),
          _inputStyle(_Telefono()),
          _inputStyle(_CantidadPersonas()),
          _inputStyle(_Nota()),
          _inputStyle(_Sector()),
          _inputStyle(_Demora()),
          _submit()
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 60, height: 3, color: CustomThemeData.greyLines);

  Widget _title() {
    
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Agregar a la lista de espera',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: CustomThemeData.dark)),
          Icon(Icons.close, color: Colors.black),
        ]);
  }
    Widget _date() => const Align(
      alignment: Alignment.topLeft,
      child: Text(
          'Lun, 21 feb (Hoy)',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)));

    Widget _inputStyle(Widget child) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              border: Border.all(color: CustomThemeData.greyLines),
              borderRadius: BorderRadius.circular(10)),
          child: child,
        );

    Widget _submit() {
    final buttonStyle = ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size(double.infinity, 50)),
          backgroundColor: MaterialStateProperty.all(CustomThemeData.primaryColor)
        );
    return ElevatedButton(
          style: buttonStyle,
          onPressed: () {},
          child: const Text('Agregar a la lista de espera', style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 14),));
  }

}



class _Nombre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Telefono extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Nota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Sector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Demora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: const [
          Icon(CupertinoIcons.time),
          Text('Demora')
        ],),
        Container()
      ],
    );
  }
}

class _CantidadPersonas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(width: 10);
    return Row(
      children: [
        const Icon(CupertinoIcons.person),
        sizedBox,
        _data(CustomThemeData.grey, CustomThemeData.dark),
        const Expanded(child: SizedBox()),
        _circleButton(CupertinoIcons.minus),
        sizedBox,
        _circleButton(Icons.add),
      ],
    );
  }

  Widget _data(Color color1, Color color2) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Cantidad de Personas', style: TextStyle(color: color1)),
          Text(
            '2 Personas',
            style: TextStyle(color: color2, fontWeight: FontWeight.w500),
          )
        ],
      );

  Widget _circleButton(IconData icon) => Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomThemeData.greyLines)),
        child: Icon(icon),
      );
}
