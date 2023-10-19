import 'package:flutter/material.dart';
import 'package:soywarmi_app/presentation/widget/custom_button.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_field.dart';
import 'package:soywarmi_app/presentation/widget/custom_text_password.dart';
import 'package:soywarmi_app/presentation/widget/google_button.dart';
import 'package:soywarmi_app/utilities/nb_colors.dart';
import 'package:soywarmi_app/utilities/nb_images.dart';
import 'package:soywarmi_app/utilities/screen_size_util.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginPageView();
  }
}

class _LoginPageView extends StatefulWidget {
  const _LoginPageView();

  @override
  State<_LoginPageView> createState() => __LoginPageViewState();
}

class __LoginPageViewState extends State<_LoginPageView> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ScreenSizeUtil.init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  NBWarmiLogo,
                  width: ScreenSizeUtil.scaleWidth(0.8),
                  height: ScreenSizeUtil.scaleHeight(0.28),
                ),
                Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: ScreenSizeUtil.scaleHeight(0.05)),
                Center(
                  child: Form(
                    key: formKey,
                    child: Column(children: [
                      const CustomTextField(label: 'Correo'),
                      const CustomTextPassword(label: 'Constreseña'),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 25),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/forgot_password');
                              },
                              child: Text('¿Olvidaste tu contraseña?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Theme.of(context)
                                          .primaryColorDark
                                          .withOpacity(0.5))),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 20,
                          right: 20,
                        ),
                        child: CustomButton(
                          label: 'Iniciar sesión',
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                      const Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('O',
                                style: TextStyle(
                                  fontSize: 16,
                                )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                        ],
                      ),
                      const GoogleButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('¿No tienes cuenta?',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .primaryColorDark
                                      .withOpacity(0.5))),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/register');
                            },
                            child: const Text(
                              ' Registrate',
                              style: TextStyle(
                                color: NBSecondPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                )
              ]),
        )),
      ),
    );
  }
}
