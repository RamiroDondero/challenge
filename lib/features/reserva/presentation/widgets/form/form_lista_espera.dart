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
          _submit(),
         
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 60, height: 3, color: CustomThemeData.greyLines);
  
  Widget _title() {
    
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          Text('Agregar a la lista de espera', style: CustomThemeData.formTitle),
          const Icon(Icons.close, color: Colors.black),
        ]);
  }
    Widget _date() => const Align(
      alignment: Alignment.topLeft,
      child: Text('Lun, 21 feb (Hoy)', style: CustomThemeData.subtitle ));

    Widget _inputStyle(Widget child) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          height: 55,
          decoration: CustomThemeData.inputStyle,
          child: child,
        );

    Widget _submit() {
    
    return ElevatedButton(
          style: CustomThemeData.buttonSubmitStyle,
          onPressed: () {},
          child: Text('Agregar a la lista de espera', style: CustomThemeData.buttonSubmitTextStyle));
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
        ]),
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

        _data(),

        const Expanded(child: sizedBox),

        _button(CupertinoIcons.minus),

        sizedBox,

        _button(Icons.add),
      ],
    );
  }

  Widget _data() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Cantidad de Personas', style: TextStyle(color: CustomThemeData.grey)),
          Text('2 Personas', style: CustomThemeData.subtitle,
          )
        ],
      );

  Widget _button(IconData icon) => Container(
        height: 34,
        width: 34,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CustomThemeData.greyLines)),
        child: Icon(icon),
      );
}
