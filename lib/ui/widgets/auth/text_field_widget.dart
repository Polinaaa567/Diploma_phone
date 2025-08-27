import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool? obscureText;
  final void Function(String)? setParams;
  final String labelText;
  final String? errorText;
  final Widget? iconsSuffix;

  const TextFieldWidget({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.setParams,
    required this.labelText,
    required this.errorText,
    required this.iconsSuffix,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        obscureText: obscureText ?? false,
        onChanged: setParams,
        decoration: InputDecoration(
          labelText: labelText,
          errorText: errorText,
          suffixIcon: iconsSuffix,
          alignLabelWithHint: false,
        ),
      ),
    );
  }
}
