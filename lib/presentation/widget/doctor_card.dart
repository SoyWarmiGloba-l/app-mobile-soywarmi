import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';

class DoctorCard extends StatelessWidget {
  final String image;
  final String name;
  final String specialty;
  final VoidCallback onPressed;
  const DoctorCard(
      {super.key,
      required this.name,
      required this.specialty,
      required this.onPressed,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: NbSecondSecondaryColor.withOpacity(0.5), width: 1.0)),
        ),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Dr $name',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                specialty,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
