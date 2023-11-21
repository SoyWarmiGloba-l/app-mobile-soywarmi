import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/widget/custom_button.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_field.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_password.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';

import '../widget/custom_text_field_login.dart';

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
  TextEditingController correo = TextEditingController();
  TextEditingController nombre = TextEditingController();
  TextEditingController apellido = TextEditingController();
  TextEditingController contrasenia = TextEditingController();
  TextEditingController confirmar_contrasenia = TextEditingController();
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
                getTextFieldRegister(context,"Correo",correo),
                getTextFieldRegister(context,"Nombre",nombre),
                getTextFieldRegister(context,"Apellido",apellido),
                getTextFieldPassowrdRegister(context,"Contrasenia",contrasenia),
                getTextFieldPassowrdRegister(context,"Contrasenia",confirmar_contrasenia),

                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: CustomButton(
                    label: 'Crear cuenta',
                    onPressed: () {
                      if(correo.text=="" || nombre.text=="" || apellido.text=="" || contrasenia.text=="" || contrasenia.text=="" || contrasenia.text!=confirmar_contrasenia.text){

                      }else{
                        _register();
                      }
                    },
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
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: correo.text,
        password: contrasenia.text,
      );
      print('Usuario registrado: ${userCredential.user?.uid}');

      Navigator.pushNamed(context, '/home');

    } on FirebaseAuthException catch (e) {
      print('Error al registrar usuario: $e');
    }
  }
}
