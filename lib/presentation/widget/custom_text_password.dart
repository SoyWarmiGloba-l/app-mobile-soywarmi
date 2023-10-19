import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';

class CustomTextPassword extends StatefulWidget {
  const CustomTextPassword({
    required this.label,
    Key? key,
    this.controller,
    this.onChanged,
    this.enabled = true,
    this.validator,
    this.onSaved,
    this.type = TextInputType.text,
  }) : super(key: key);

  final String label;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final bool enabled;
  final TextInputType type;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  State<CustomTextPassword> createState() => _CustomTextPasswordState();
}

class _CustomTextPasswordState extends State<CustomTextPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        obscureText: obscureText,
        onChanged: widget.onChanged,
        keyboardType: widget.type,
        decoration: InputDecoration(
          filled: true,
          fillColor: NbSecondSecondaryColor,
          labelText: widget.label,
          labelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColor,
            ),
          ),
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
        enabled: widget.enabled,
        validator: widget.validator,
        onSaved: widget.onSaved,
      ),
    );
  }
}
