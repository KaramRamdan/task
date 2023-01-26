
import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  required FormFieldValidator<String>? onValidate,
  VoidCallback? suffixPressed,
  required String label,
  required IconData prefix,
  bool isPassword = false,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChanged,
      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,

          ),
        ),
        border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(30)
        ),
      ),
    );
