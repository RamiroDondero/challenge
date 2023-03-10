import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:woki_partner/core/constants/ui_values.dart';
import 'package:woki_partner/features/reserva/presentation/bloc/reservas/reservas_bloc.dart';

import '../../../../../core/constants/custom_theme_data.dart';
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
      'demora': 0, 
      'sinEspera': 'En espera de una mesa'
    };

    final day = CustomDataTime.day;
    final month = CustomDataTime.month;
    final weekday = CustomDataTime.weekday;
    final dia = CustomDataTime.dia;
    final mes = CustomDataTime.mes;
    final bloc = BlocProvider.of<ReservasBloc>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container( width: 60, height: 3, color: CustomThemeData.greyLines),
                ),
                
                const SizedBox(height: 15),
                
                const _Title(),
                
                const SizedBox(height: 3),
                
                Text('${dia[weekday]}, $day de ${mes[month]} (Hoy)'),
                
                const SizedBox(height: 10),
                
                CustomInputField(
                  validator: true,
                  labelText: 'NOMBRE*',
                  hintText: 'Escribe tu nombre',
                  formProperty: 'nombre',
                  formValues: formValues,
                ),
                
                const SizedBox(height: 10),
                
                CustomInputField(
                  textInputType: TextInputType.phone,
                  labelText: 'TELEFONO',
                  hintText: 'Escribe tu tel??fono',
                  formProperty: 'telefono',
                  formValues: formValues,
                ),
                
                const SizedBox(height: 10),
                
                _InputStyle(
                    child: _CantidadPersonas(
                       personas: 'personas',
                       formValues: formValues)
                       ),
                
                const SizedBox(height: 10),
                
                CustomInputField(
                    labelText: 'AGREGAR NOTA',
                    hintText: 'Agrega una nota sobre la reserva',
                    formProperty: 'comentario',
                    formValues: formValues),
                
                const SizedBox(height: 10),
                
                _Preferences(
                    formProperty: 'sector',
                    formValues: formValues,
                    initSelected: 1,
                    icon: CustomThemeData.tableRestaurantIcon,
                    opciones: FormValues.opcionesUbicacion,
                    titulo: 'SECTOR'),
                
                const SizedBox(height: 10),
                
                _Preferences(
                    formProperty: 'demora',
                    formValues: formValues,
                    initSelected: 0,
                    icon: CupertinoIcons.clock,
                    opciones: FormValues.opcionesDemora,
                    titulo: 'DEMORA'),
                
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
    
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
          const Text(
            'Cantidad de Personas',
             style: TextStyle(color: CustomThemeData.grey)),
                Text(
                  '$personas Personas',
                  style: CustomThemeData.subtitle,
                )
        ],
      );
}

class _Preferences extends StatefulWidget {
  final String titulo;
  final IconData icon;
  final List<String> opciones;
  final int initSelected;
  final Map<String, dynamic> formValues;
  final String formProperty;

  const _Preferences(
      {required this.titulo,
      required this.icon,
      required this.opciones,
      required this.initSelected,
      required this.formValues,
      required this.formProperty});

  @override
  State<_Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<_Preferences> {
  
  int selected = 0;

  @override
  void initState() {
    super.initState();
    selected = widget.initSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10),
      decoration: CustomThemeData.inputStyle,
      child: Column(
        children: [
          ListTile(
              minLeadingWidth: 0,
              dense: true,
              iconColor: CustomThemeData.primaryColor,
              leading: Icon(widget.icon, size: 16),
              title: Text(widget.titulo, style: CustomThemeData.subtitle)),
          Align(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    widget.opciones.length,
                    (index) => Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: ElevatedButton(
                              onPressed: () {
                                selected = index;
                                widget.formValues[widget.formProperty] =  widget.opciones[index];
                                setState(() {});
                              },
                              style: selected == index
                                  ? CustomThemeData.optionButtonselected
                                  : CustomThemeData.optionButtonNoselected,
                              child: Text(widget.opciones[index],
                                  style: selected == index
                                      ? const TextStyle(color: Colors.white)
                                      : const TextStyle(
                                          color:
                                              CustomThemeData.primaryColor))),
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
