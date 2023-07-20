import 'package:flutter/material.dart';

Widget inputField({
  int? maxLines,
  required TextEditingController controller,
  required String label,
  required String isValidText,
  Icon? prefix,
  Icon? suffix,
  Icon? icon,
  bool obscureText = false,
  bool isEmail = false,
   Function()? onTap
}) {
  return TextFormField(
    textAlignVertical: TextAlignVertical.center,
    decoration: InputDecoration(
        icon: icon,
        label: Text(label),
        prefix: Padding(
          padding: const EdgeInsetsDirectional.only(end: 15),
          child: prefix,
        ),
        suffix: suffix,
        contentPadding: const EdgeInsetsDirectional.all(15),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        )),
    controller: controller,
    validator: (value) {
      if (value!.isEmpty) {
        return isValidText;
      }
      if (isEmail && !value.contains('@')) {
        return 'Not valid Email';
      }
      return null;
    },
    obscureText: obscureText,
    onFieldSubmitted: (value) {
      controller.text = value;
    },
    maxLines: maxLines,

    onTap: onTap,
  );
}

