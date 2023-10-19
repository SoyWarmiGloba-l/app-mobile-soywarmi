import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Text(
            'Hola, Luis Gonzales!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            '¿Que tienes planeado para hoy?',
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
