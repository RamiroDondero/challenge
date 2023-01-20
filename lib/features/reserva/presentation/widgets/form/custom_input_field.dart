import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String formProperty;
  final Map<String, dynamic> formValues;
  final bool? validator;
  final TextInputType? textInputType;

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.validator = false,
    this.textInputType,
    required this.formProperty,
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      textCapitalization: TextCapitalization.words,
      autofocus: true,
      onChanged: (value) {
        formValues[formProperty] = value;
      },
      validator: (value) {
        if (validator == false) {
          return null;
        }else{
        if (value == null) return '*Este campo es requerido.';
        return value.length < 3 ? '*Este campo es requerido , min 3 caracteres.' : null;
        }
        
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
