import 'package:flutter/material.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class GoogleButton extends StatelessWidget {

  final void Function()? onPressed;
  const GoogleButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                  color: Color.fromARGB(255, 158, 155, 155), width: 1),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                NBGoogleLogo,
                width: 25,
                height: 25,
              ),
              const SizedBox(width: 10),
              const Text(
                'Iniciar sesión con Google',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
