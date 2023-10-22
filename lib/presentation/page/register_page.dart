import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/widget/custom_button.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_field.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_password.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _RegisterPage();
  }
}

class _RegisterPage extends StatefulWidget {
  const _RegisterPage();

  @override
  State<_RegisterPage> createState() => __RegisterPageState();
}

class __RegisterPageState extends State<_RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        margin: EdgeInsets.only(right: 23, left: 23),
        child: SingleChildScrollView(
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  NBWarmiLogo,
                  height: 160,
                  width: 250,
                ),
                const Text(
                  'Crea tu cuenta',
                  style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: NBPrimaryColor),
                ),
                const SizedBox(height: 10),
                const CustomTextField(label: 'Correo'),
                const CustomTextField(label: 'Nombre'),
                const CustomTextField(label: 'Apellido'),
                const CustomTextPassword(label: 'Contraseña'),
                const CustomTextPassword(label: 'Confirmar contraseña'),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: CustomButton(
                    label: 'Crear cuenta',
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿Ya tienes cuenta?',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryColorDark
                                .withOpacity(0.5))),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        ' Inicia Sesión',
                        style: TextStyle(
                          color: NBSecondPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
      )),
    );
  }
}
