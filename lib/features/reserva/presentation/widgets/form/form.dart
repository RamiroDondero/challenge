import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/custom_theme_data.dart';
import '../widgets.dart';

class FormListaEspera extends StatelessWidget {
  const FormListaEspera({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    Map<String, dynamic> formValues = {'name': '', 'tel': '', 'nota': ''};

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
          key: formKey,
          child: DraggableScrollableSheet(
            initialChildSize: 0.88,
            maxChildSize: 0.89,
            minChildSize: 0.0,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        width: 60, height: 3, color: CustomThemeData.greyLines),
                    const SizedBox(height: 20),
                    const _Title(),
                    const SizedBox(height: 30),
                    CustomInputField(
                      formProperty: 'name',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 30),
                    CustomInputField(
                      formProperty: 'tel',
                      formValues: formValues,
                    ),
                    const SizedBox(height: 30),
                    const _InputStyle(child: _CantidadPersonas()),
                    const SizedBox(height: 30),
                    CustomInputField(
                        formProperty: 'nota', formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        formProperty: 'nota', formValues: formValues),
                    const SizedBox(height: 30),
                    CustomInputField(
                        formProperty: 'nota', formValues: formValues),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              CustomThemeData.primaryColor)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: SizedBox(
                            width: double.infinity,
                            child:
                                Center(child: Text('Agregar a lista espera'))),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        if (!formKey.currentState!.validate()) return;
                        print(formValues);
                      },
                    )
                  ],
                ),
              );
            },
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
          onTap: () {
            Navigator.pop(context);
          },
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

class _CantidadPersonas extends StatelessWidget {
  const _CantidadPersonas();
  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(width: 10);
    return Row(
      children: [
        const Icon(CupertinoIcons.person),
        sizedBox,
        _data(),
        const Expanded(child: sizedBox),
        const CircleButton(icon: CupertinoIcons.minus),
        sizedBox,
        const CircleButton(icon: Icons.add)
      ],
    );
  }

  Widget _data() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('Cantidad de Personas',
              style: TextStyle(color: CustomThemeData.grey)),
          Text(
            '2 Personas',
            style: CustomThemeData.subtitle,
          )
        ],
      );
}
