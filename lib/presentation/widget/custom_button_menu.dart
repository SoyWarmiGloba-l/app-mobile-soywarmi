import 'package:flutter/material.dart';

class CustomButtonMenu extends StatelessWidget {
  const CustomButtonMenu({
    required this.label,
    required this.onPressed,
    required this.color,
    super.key,
    this.icon,
    this.withButton,
    this.size = 48.0,
  });

  final String label;
  final VoidCallback onPressed;
  final Color color;
  final IconData? icon;
  final double size;
  final double? withButton;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: size * 0.5, color: color),
              Text(
                label,
                style: TextStyle(fontSize: size * 0.3, color: color),
                textAlign: TextAlign.center,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: color, // The icon will be white.
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
