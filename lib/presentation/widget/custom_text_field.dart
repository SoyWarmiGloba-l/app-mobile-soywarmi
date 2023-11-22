import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.label,
    super.key,
    this.controller,
    this.obscureText = false,
    this.icon,
    this.onChanged,
    this.enabled = true,
    this.type = TextInputType.text,
    this.validator,
    this.onSaved,
    this.colored = false,
  });
  final String label;
  final TextEditingController? controller;
  final bool obscureText;
  final IconData? icon;
  final void Function(String?)? onChanged;
  final bool enabled;
  final TextInputType type;
  final String? Function(String?)? validator;
  final bool colored;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        keyboardType: type,
        decoration: InputDecoration(
          filled: true,
          fillColor: colored ? NbSecondSecondaryColor : null,
          labelText: label,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            fontSize: 15,
          ),
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).cardColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
        ),
        enabled: enabled,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
