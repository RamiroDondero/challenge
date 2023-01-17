import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';

import '../../../../../core/custom_theme_data.dart';
import '../widgets.dart';

class FormListaEspera extends StatelessWidget {
  const FormListaEspera({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Map<String, dynamic> formValues = {
      'nombre': '',
      'telefono': '',
      "personas": 1,
      'comentario': '',
      "sector": 'Adentro',
      'demora': 20
    };
    final bloc = BlocProvider.of<ReservasBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: 60, height: 3, color: CustomThemeData.greyLines),
                const SizedBox(height: 20),
                const _Title(),
                const SizedBox(height: 30),
                CustomInputField(
                  validator: true,
                  labelText: 'NOMBRE*',
                  hintText: 'Escribe tu nombre',
                  formProperty: 'nombre',
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'TELEFONO',
                  hintText: 'Escribe tu teléfono',
                  formProperty: 'telefono',
                  formValues: formValues,
                ),
                const SizedBox(height: 10),
                _InputStyle(
                    child: _CantidadPersonas(
                        personas: 'personas', formValues: formValues)),
                const SizedBox(height: 10),
                CustomInputField(
                    labelText: 'AGREGAR NOTA',
                    hintText: 'Agrega una nota sobre la reserva',
                    formProperty: 'comentario',
                    formValues: formValues),
                const SizedBox(height: 10),
                const _Preferences(
                  icon: CustomThemeData.tableRestaurantIcon,
                  opciones: ['Terraza','Adentro','Barra'],
                  titulo: 'SECTOR'
                   ),
                const SizedBox(height: 10),
                const _Preferences(
                  icon: CupertinoIcons.clock,
                  opciones: ['Sin Demora','5 min','10 min', '20 min'],
                  titulo: 'DEMORA'
                   ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: CustomThemeData.buttonSubmitStyle,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: SizedBox(
                        width: double.infinity,
                        child: Center(child: Text('Agregar a lista espera'))),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!formKey.currentState!.validate()) return;
                    bloc.add(AddListaEsperaEvent(formValues));
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          )),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('Agregar a la lista de espera', style: CustomThemeData.formTitle),
      GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.close, color: Colors.black)),
    ]);
  }
}

class _InputStyle extends StatelessWidget {
  final Widget child;

  const _InputStyle({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: 55,
        decoration: CustomThemeData.inputStyle,
        child: child);
  }
}

class _CantidadPersonas extends StatefulWidget {
  final String personas;
  final Map<String, dynamic> formValues;

  const _CantidadPersonas({required this.personas, required this.formValues});

  @override
  State<_CantidadPersonas> createState() => _CantidadPersonasState();
}

class _CantidadPersonasState extends State<_CantidadPersonas> {
  int personas = 1;

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(width: 10);

    return Row(
      children: [
        const Icon(CupertinoIcons.person),
        sizedBox,
        _data(),
        const Expanded(child: sizedBox),
        GestureDetector(
            onTap: () {
              setState(() {
                if (personas <= 1) return;
                personas -= 1;
              });
            },
            child: const CircleButton(icon: CupertinoIcons.minus)),
        sizedBox,
        GestureDetector(
            onTap: () {
              setState(() {
                personas += 1;
                widget.formValues[widget.personas] = personas;
              });
            },
            child: const CircleButton(icon: Icons.add)),
      ],
    );
  }

  Widget _data() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Cantidad de Personas',
              style: TextStyle(color: CustomThemeData.grey)),
          Text(
            '$personas Personas',
            style: CustomThemeData.subtitle,
          )
        ],
      );
}

class _Preferences extends StatelessWidget {
  final String titulo;
  final IconData icon;
  final List<String> opciones;

  const _Preferences({
    required this.titulo,
    required this.icon,
    required this.opciones
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10 , left: 10),
      decoration: CustomThemeData.inputStyle,
      child: Column(
        children: [
          ListTile( 
            minLeadingWidth: 0,
            dense:true ,
            iconColor: CustomThemeData.primaryColor,
            leading: Icon(icon , size: 16),
            title: Text(titulo ,
            style: CustomThemeData.subtitle
            )),
          Row(
            children: List.generate(opciones.length, (index) => 
              Padding(
                padding: const  EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  onPressed: (){},
                  style: CustomThemeData.optionButtonselected ,
                  child: Text(opciones[index])),
              )
            ),
          )
        ],
      ),
    );
  }
}
